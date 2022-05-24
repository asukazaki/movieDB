import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:moviedb/api/search_movie/SearchMovieResponse.dart';
import 'package:moviedb/detail/MovieDetailViewModel.dart';
import 'package:moviedb/list/MovieListViewModel.dart';

import '../api/NetworkError.dart';
import '../detail/MovieDetail.dart';

class MovieList extends HookConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(movieListViewModelProvider);

    final _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent * 0.95 &&
          !viewModel.isReadMore) {
        viewModel.readMoreMovies();
      }
    });

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: AppBar(
          title: Text("${viewModel.response?.totalResults ?? "-"} 件"),
        ),
      ),
      body: HookBuilder(
        builder: (context) {
          final state = viewModel.state;
          if (state == null) {
            return Container();
          }
          return state.when(
              data: (MovieListData data) {
                return data.results.isEmpty
                    ? const Center(child: Text("検索にヒットしませんでした。"))
                    : ListView.builder(
                  itemBuilder: (context, index){
                    return GestureDetector(
                      child: _listItem(data.results[index], (text) { }),
                      onTap: () {
                        ref.read(movieDetailViewModelProvider).initialize(data.results[index].id, data.results[index].title, data.results[index].overview);
                        ref.read(movieDetailViewModelProvider).fetch();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MovieDetail()),
                        );
                      },
                    );
                  },
                  itemCount: data.results.length,
                  controller: _scrollController,
                );
              },
              loading: () {
                return const Center(child: CircularProgressIndicator());
              },
              error: (NetworkError error) {
                return _errorView(error.errorMessage, () { viewModel.fetchMovies(); });
              },

          );
        },
      ),
    );
  }

  Widget _listItem(Result result, void Function(String text) onTap) {
    return
      Padding(padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 135,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
              border: Border.all(color: const Color.fromRGBO(211, 211, 211, 1)),
              borderRadius: BorderRadius.circular(6),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 1.0,
                  blurRadius: 6.0,
                  offset: Offset(-4, 4),
                ),
              ]
          ),
          child: Container(
              color: Colors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                      child: result.posterPath != null
                        ? CachedNetworkImage(
                        imageUrl: 'https://image.tmdb.org/t/p/original/${result.posterPath}',
                        placeholder: (context, url) => const CircularProgressIndicator(),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                        width: 100,
                        )
                        : const Image(image: AssetImage("images/noImage.png")),
                      flex: 1),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Text(result.title ?? "-",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        const SizedBox(height: 4),
                        Visibility(
                          child: Text(result.releaseDate != null ? DateFormat('yyyy/MM/dd(E)', "ja_JP").format(result.releaseDate!) : "-",
                              style: const TextStyle(
                                  color: Color.fromRGBO(99, 99, 99, 1),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold)
                          ),
                          visible: result.releaseDate != null,
                        ),
                        const SizedBox(height: 10),
                        Visibility(
                          child: Expanded(child: Text(result.overview ?? "-",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          )),
                          visible: result.overview != null,
                        )

                      ],
                    ),
                    flex: 3,
                  )
                ],
              )
          ),
        ),
      );
  }

  Widget _errorView(String? message, void Function() onTap) {
    return Center(child: Column(
      children: [
        SizedBox(width: 400,
        child: ElevatedButton(
          child: const Text('再試行'),
          style: ElevatedButton.styleFrom(
            primary: Colors.lightBlue,
            onPrimary: Colors.white,
            shape: const CircleBorder(
              side: BorderSide(
                color: Colors.lightBlue,
                width: 1,
                style: BorderStyle.solid,
              ),
            ),
          ),
          onPressed: () {
            onTap();
          },
        )),
        const SizedBox(height: 20),
        Text(message ?? ""),
      ],
    ));
  }

  Widget _drawerList() {
    List<SortType> list = [
      SortType.defaultSort,
      SortType.releaseDesc,
      SortType.releaseAsc,
      SortType.rate,
    ];

    return ListView.builder(
      itemBuilder: (context, index){
        return ListTile(
          title: Text(list[index].displayName),
          onTap: (){

          },
        );
      },
      itemCount: 5,
    );
  }
}

enum SortType {
  defaultSort,
  releaseAsc,
  releaseDesc,
  rate,
}

extension SortTypeExtension on SortType {
  static final displayNames = {
    SortType.defaultSort: "デフォルト順",
    SortType.releaseAsc: "公開が古い順",
    SortType.releaseDesc: "公開が新しい順",
    SortType.rate: "評価が高い順",
  };

  String get displayName => displayNames[this]!;
}