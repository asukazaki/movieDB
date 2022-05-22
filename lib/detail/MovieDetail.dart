import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moviedb/api/NetworkError.dart';
import 'package:moviedb/api/detail/MovieDetailResponse.dart';
import 'package:moviedb/detail/ui/MovieDetailSection.dart';

import 'MovieDetailViewModel.dart';

class MovieDetail extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(movieDetailViewModelProvider);

    return Scaffold(
      body: HookBuilder(
        builder: (context) {
          final state = viewModel.state;
          if (state == null) {
            return Container();
          }
          return state.when(
              data: (MovieDetailInfo response) {
                // _hoge(response, MediaQuery.of(context).size);
                return CustomScrollView(
                  // physics: ClampingScrollPhysics(),
                  slivers: [
                    _sliverAppBar(response.detail, MediaQuery.of(context).size, () {
                      Navigator.pop(context);
                    }),
                    SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) =>
                            MovieDetailSection(index: index, response: response, overview: viewModel.overview, size: MediaQuery.of(context).size),
                          childCount: 4,
                        )),
                  ],
                );
              },
              loading: () {
                return const Center(child: CircularProgressIndicator());
              },
              error: (NetworkError error){
                return _errorView(error.errorMessage, () { viewModel.fetch(); });
              });
        },
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

  Widget _sliverAppBar(MovieDetailResponse response, Size size, void Function() onTap) {
    return SliverAppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            onTap();
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.white.withOpacity(0.6),
            shape: const CircleBorder(),
            padding: EdgeInsets.zero,
          ),
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black54,
            size: 16,
          ),
        ),
      ),
      expandedHeight: 380,
      backgroundColor: Colors.white60,
      pinned: true,
      elevation: 2,
      // Text(response.title ?? "-", style: const TextStyle(color: Colors.black87), maxLines: 5,)
      flexibleSpace: FlexibleSpaceBar(
        title: Container(
          padding: EdgeInsets.fromLTRB(90, 30, 8, 8),
          child: Text(response.title ?? "-", style: const TextStyle(color: Colors.black87), maxLines: 5,),
        ),
        titlePadding: const EdgeInsets.all(8),
        collapseMode: CollapseMode.pin,
        // centerTitle: true,
        background: Stack(children: [
          SizedBox(
            height: 350,
            width: size.width
          ),
          Positioned(
            top: 0,
            child: SizedBox(
              height: 320.0,
              width: size.width,
              child: CachedNetworkImage(
                imageUrl: 'https://image.tmdb.org/t/p/original/${response.posterPath}',
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 260,
            left: 20,
            child: CircleAvatar(
              radius: 60,
              backgroundImage: CachedNetworkImageProvider(
                'https://image.tmdb.org/t/p/original/${response.backdropPath}'
              ),
            ),
          ),
        ]),
      ),
    );
  }
}