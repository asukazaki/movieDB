import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:moviedb/MovieDBApp.dart';
import 'package:moviedb/db/MylistMovieProvider.dart';
import 'package:moviedb/detail/MovieDetailViewModel.dart';
import 'package:moviedb/list/ListItem.dart';
import 'package:moviedb/list/MovieListViewModel.dart';
import 'package:moviedb/service/Text+Extension.dart';

import '../api/NetworkError.dart';
import '../detail/MovieDetail.dart';

class Mylist extends HookConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final viewModel = ref.watch(movieListViewModelProvider);
    final mylistProvider = ref.watch(mylistMovieProvider);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: AppBar(
          title: TextX.textX("お気に入り"),
        ),
      ),
      body: HookBuilder(
        builder: (context) {
          final state = mylistProvider.state;
          if (state == null) {
            return Container();
          }
          return state.when(
            data: (List<MovieListItem> data) {
              return data.isEmpty
                  ? Container(
                      child: Center(
                          child: TextX.textX("お気に入り登録すると\n後から気になる映画をチェックできます")),
                      color: backgroundColor)
                  : Container(
                      color: backgroundColor,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            child: ListItem(item: data[index]),
                            onTap: () {
                              final result = data[index];
                              ref.read(movieDetailViewModelProvider).initialize(
                                  MovieDetailEntry(result.id, result.title,
                                      result.overview));
                              ref.read(movieDetailViewModelProvider).fetch();
                              ref.read(mylistMovieProvider).existsMylist(result.id);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MovieDetail()),
                              );
                            },
                          );
                        },
                        itemCount: data.length,
                      ));
            },
            loading: () {
              return const Center(child: CircularProgressIndicator());
            },
            error: (NetworkError error) {
              return Container(
                  child: Center(child: TextX.textX("エラーです")),
                  color: backgroundColor);
            },
          );
        },
      ),
    );
  }
}