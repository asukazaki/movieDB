import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moviedb/MovieDBApp.dart';
import 'package:moviedb/home/HomeViewModel.dart';
import '../db/MylistMovieProvider.dart';
import '../detail/MovieDetail.dart';
import '../detail/MovieDetailViewModel.dart';
import '../service/Text+Extension.dart';

import '../list/MovieList.dart';
import '../list/MovieListViewModel.dart';

class Home extends HookConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  String _message = "";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(homeViewModelProvider);

    _onTapSearch() async {
      if (_formKey.currentState!.validate()) {
        // バリデーションチェック後
        _formKey.currentState!.save();

        ref.watch(movieListViewModelProvider).setSearchWord(_message);
        ref.read(movieListViewModelProvider).fetchMovies(shouldReset: true);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MovieList()),
        );
      }
    }

    _onTapItem(MovieListItem item) {
      ref.read(movieDetailViewModelProvider).initialize(
          MovieDetailEntry(
              item.id,
              item.title,
              item.overview)
      );
      ref.read(movieDetailViewModelProvider).fetch();
      ref.read(mylistMovieProvider).existsMylist(item.id);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MovieDetail()),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: TextX.textX("home")
      ),
      body: HookBuilder(
        builder: (context) {
          final state = viewModel.state;
          if (state == null) {
            return Container();
          }
          return state.when(
              data: (HomeCarouselViewInfo info) {
                return Container(
                    color: backgroundColor,
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        _search(_onTapSearch),
                        _carousel(
                            "知名度の高い順",
                            info.popularItems,
                            (p0) {
                              _onTapItem(p0);
                            },
                            false,
                            false),
                        _carousel(
                            "投票の多い順",
                            info.voteCountItems,
                                (p0) {
                              _onTapItem(p0);
                            },
                            false,
                            false),
                      ],
                    )
                );
              },
              loading: (){
                return Container(
                    color: backgroundColor,
                    child: Column(
                      children: [
                        _search(_onTapSearch),
                        _carousel(
                            "知名度の高い順",
                            [],
                            (p0) {},
                            true,
                            false),
                        _carousel(
                            "投票の多い順",
                            [],
                            (p0) {},
                            true,
                            false),
                      ],
                    )
                );
              },
              error: (error) {
                return Container(
                    color: backgroundColor,
                    child: Column(
                      children: [
                        _search(_onTapSearch),
                        _carousel(
                            "知名度の高い順",
                            [],
                                (p0) {},
                            false,
                            true),
                        _carousel(
                            "投票の多い順",
                            [],
                                (p0) {},
                            false,
                            true),
                      ],
                    )
                );
              });
        },
      )
    );
  }

  Widget _search(void Function() onTapSearch) {
    return Expanded(child: SizedBox(
      height: 160,
      child: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                // decoration: const InputDecoration(labelText: '検索', labelStyle: TextStyle(color: textColor)),
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: '検索',
                  labelStyle: TextStyle(color: textColor),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: textColor),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: textColor),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "入力必須です。";
                  }
                  return null;
                },
                onSaved: (value) {
                  _message = value!;
                },
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: TextX.textX("検索"),
                  onPressed: () {
                    onTapSearch();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  Widget _carousel(String title, List<MovieListItem> items, void Function(MovieListItem) onTapItem, bool loading, bool error) {
    if (error) {
      return Container(height: 0);
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(8),
          child: Text(title, style: const TextStyle(color: Colors.white)),
          color: secondaryColor,
        ),
        // Container(height: 8, color: secondaryColor),
        Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
            child: SizedBox(
              height: 160,
              child: loading ? const Center(child: CircularProgressIndicator())
                  : ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                    return GestureDetector(
                      child: _carouselItem(items[index]),
                      onTap: () {
                        onTapItem(items[index]);
                      },
                    );
                  },
                  itemCount: items.length,
                  separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 16)
              ),
            ),
        )
      ],
    );
  }

  Widget _carouselItem(MovieListItem item) {
    return Container(
      // padding: EdgeInsets.all(6),
        height: 150,
        width: 110,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
            border: Border.all(color: const Color.fromRGBO(211, 211, 211, 1)),
            borderRadius: BorderRadius.circular(6)),
        child: Column(
          children: [
            Expanded(child: CachedNetworkImage(
              imageUrl: 'https://image.tmdb.org/t/p/original/${item.posterPath}',
              errorWidget: (context, url, error) => const Icon(Icons.error),
              width: 110,
              height: 160,
              fit: BoxFit.fitWidth,
            )),
          ],
        ));
  }
}