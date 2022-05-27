import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:moviedb/MovieDBApp.dart';
import 'package:moviedb/db/MylistMovieProvider.dart';
import 'package:moviedb/detail/MovieDetailViewModel.dart';
import 'package:moviedb/list/MovieListViewModel.dart';

import '../api/NetworkError.dart';
import '../detail/MovieDetail.dart';
import '../service/Text+Extension.dart';
import 'ListItem.dart';

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

    return WillPopScope(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: AppBar(
              title: TextX.textX("${viewModel.totalHits ?? "-"} 件"),
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
                      ? Container(color: backgroundColor, child: Center(child: TextX.textX("検索にヒットしませんでした。")),)
                      : Container(
                      color: backgroundColor,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            child: ListItem(item: data.results[index]),
                            onTap: () {
                              final result = data.results[index];
                              ref
                                  .read(movieDetailViewModelProvider)
                                  .initialize(MovieDetailEntry(result.id,
                                  result.title, result.overview));
                              ref.read(movieDetailViewModelProvider).fetch();
                              ref.read(mylistMovieProvider).existsMylist(data.results[index].id);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MovieDetail()),
                              );
                            },
                          );
                        },
                        itemCount: data.results.length,
                        controller: _scrollController,
                      )
                  );
                },
                loading: () {
                  return Container(color: backgroundColor, child: const Center(child: CircularProgressIndicator()));
                },
                error: (NetworkError error) {
                  return _errorView(error.errorMessage, () { viewModel.fetchMovies(); });
                },

              );
            },
          ),
        ),
        onWillPop: () async {
            viewModel.resetListItem();
            return true;
        });
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