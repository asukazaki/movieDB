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

class MovieDetailEntry {
  int movieId = 0;
  String? title;
  String? overview;

  MovieDetailEntry(this.movieId, this.title, this.overview);
}

class MovieDetailViewModel extends ChangeNotifier {
  final MovieDetailRepository _movieDetailRepository;
  final MovieDetailCreditsRepository _movieDetailCreditsRepository;

  MovieDetailViewModel(this._movieDetailRepository, this._movieDetailCreditsRepository);

  LoadingState<MovieDetailInfo>? state;

  int currentMovieIndex = 0;
  List<MovieDetailEntry> entries = [];
  List<MovieDetailInfo> detailInfos = [];

  MovieDetailResponse? _response;
  MovieDetailResponse? get response => _response;

  void initialize(MovieDetailEntry entry) {
    entries.add(entry);
  }

  void setCurrentIndex() {
    state = LoadingState.data(data: detailInfos[currentMovieIndex]);
    notifyListeners();
  }

  void willPop() {
    detailInfos.removeAt(currentMovieIndex);
    entries.removeAt(currentMovieIndex);
    if (detailInfos.isNotEmpty) {
      currentMovieIndex --;
    }
  }

  Future<void> fetch() async {
    if (detailInfos.isNotEmpty) {
      currentMovieIndex ++;
    }
    state = const LoadingState.loading();
    notifyListeners();

    final detail = _movieDetailRepository.fetch(entries[currentMovieIndex].movieId);
    final credits = _movieDetailCreditsRepository.fetch(entries[currentMovieIndex].movieId);

    return detail.then((response) {
      response.when(
          success: (MovieDetailResponse detail) {
            credits.then((response) {
              response.when(
                  success: (MovieDetailCreditsResponse credits) {
                    detailInfos.add(MovieDetailInfo(detail, credits));
                    state = LoadingState.data(data: detailInfos[currentMovieIndex]);
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

  String? get overview => entries[currentMovieIndex].overview;
}

class MovieDetailInfo {
  final MovieDetailResponse detail;
  final MovieDetailCreditsResponse credits;

  MovieDetailInfo(this.detail, this.credits);
}