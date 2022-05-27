import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moviedb/api/LoadingState.dart';
import 'package:moviedb/api/discover/DiscoverRepository.dart';
import 'package:moviedb/api/discover/DiscoverResponse.dart';
import 'package:moviedb/api/person/PersonMovieCreditsRepository.dart';
import 'package:moviedb/api/person/PersonMovieCreditsResponse.dart';
import 'package:moviedb/api/search_movie/SearchMovieRepository.dart';

import '../api/NetworkError.dart';
import '../api/search_movie/SearchMovieResponse.dart';
import '../list/MovieListViewModel.dart';

final homeViewModelProvider = ChangeNotifierProvider((ref) => HomeViewModel(DiscoverRepository()));

class HomeViewModel extends ChangeNotifier {
  final DiscoverRepository _discoverRepository;

  HomeViewModel(this._discoverRepository) {
    fetchMovies();
  }

  LoadingState<HomeCarouselViewInfo>? state;

  HomeCarouselViewInfo? result;

  Future<void> fetchMovies() async {
    state = const LoadingState.loading();
    notifyListeners();

    final popular = _discoverRepository.fetchByPopularity();
    final vote = _discoverRepository.fetchByVoteCount();

    return popular.then((response) {
      response.when(
          success: (DiscoverResponse popular) {
            vote.then((response) {
              response.when(
                  success: (DiscoverResponse vote) {
                    if (popular.results == null || vote.results == null) {
                      state = LoadingState.error(error: NetworkError.unexpectedError());
                      notifyListeners();
                    }
                    result = HomeCarouselViewInfo(
                        popular.results!.map((e) => MovieListItem(id: e.id!, title: e.title, posterPath: e.posterPath, releaseDate: e.releaseDate,overview: e.overview)).toList(),
                        vote.results!.map((e) => MovieListItem(id: e.id!, title: e.title, posterPath: e.posterPath, releaseDate: e.releaseDate,overview: e.overview)).toList());
                    state = LoadingState.data(data: result!);
                    notifyListeners();
                  },
                  failure: (NetworkError error) {
                    state = LoadingState.error(error: error);
                    notifyListeners();
                  });
            });
          },
          failure: (NetworkError error) {
            state = LoadingState.error(error: error);
            notifyListeners();
          });
    });
  }
}

class HomeCarouselViewInfo {
  List<MovieListItem> popularItems;
  List<MovieListItem> voteCountItems;

  HomeCarouselViewInfo(this.popularItems, this.voteCountItems);
}