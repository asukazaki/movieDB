import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moviedb/api/LoadingState.dart';
import 'package:moviedb/api/detail/MovieDetailCreditsRepository.dart';
import 'package:moviedb/api/detail/MovieDetailCreditsResponse.dart';
import 'package:moviedb/api/detail/MovieDetailRepository.dart';
import 'package:moviedb/api/detail/MovieDetailResponse.dart';

import '../api/NetworkError.dart';

final movieDetailViewModelProvider = ChangeNotifierProvider((ref) => MovieDetailViewModel(MovieDetailRepository(), MovieDetailCreditsRepository()));

class MovieDetailViewModel extends ChangeNotifier {
  final MovieDetailRepository _movieDetailRepository;
  final MovieDetailCreditsRepository _movieDetailCreditsRepository;

  int _movieId = 0;
  int get movieId => _movieId;
  String? _title;
  String? get title => _title;
  String? _overview;
  String? get overview => _overview;

  MovieDetailViewModel(this._movieDetailRepository, this._movieDetailCreditsRepository);

  LoadingState<MovieDetailInfo>? state;

  MovieDetailResponse? _response;
  MovieDetailResponse? get response => _response;

  void initialize(int movieId, String? title, String? overview) {
    _movieId = movieId;
    _title = title;
    _overview = overview;
  }

  Future<void> fetch() async {
    state = const LoadingState.loading();
    notifyListeners();

    List<Future> futures = [];
    futures.add(_movieDetailRepository.fetch(movieId));
    futures.add(_movieDetailCreditsRepository.fetch(movieId));

    final detail = _movieDetailRepository.fetch(movieId);
    final credits = _movieDetailCreditsRepository.fetch(movieId);

    return detail.then((response) {
      response.when(
          success: (MovieDetailResponse detail) {
            credits.then((response) {
              response.when(
                  success: (MovieDetailCreditsResponse credits) {
                    state = LoadingState.data(data: MovieDetailInfo(detail, credits));
                    notifyListeners();
                  },
                  failure: (NetworkError error) {
                    state = LoadingState.error(error: error);
                    notifyListeners();
              });
            });
            // state = LoadingState.data(data: response);
            // _response = response;
            // notifyListeners();
          },
          failure: (NetworkError error) {
            state = LoadingState.error(error: error);
            notifyListeners();
          });
    });
  }
}

class MovieDetailInfo {
  final MovieDetailResponse detail;
  final MovieDetailCreditsResponse credits;

  MovieDetailInfo(this.detail, this.credits);
}