import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moviedb/api/LoadingState.dart';
import 'package:moviedb/api/search_movie/SearchMovieRepository.dart';

import '../api/NetworkError.dart';
import '../api/search_movie/SearchMovieResponse.dart';

final movieListViewModelProvider = ChangeNotifierProvider((ref) => MovieListViewModel(SearchMovieRepository()));

// final futureProvider = FutureProvider<ApiResult<SearchMovieResponse>>((ref) async {
//   return MovieListViewModel(SearchMovieRepository()).fetch();
// });

class MovieListData {
  int page;
  List<Result> results;
  int totalResults;

  MovieListData(this.page, this.results, this.totalResults);
}

class MovieListViewModel extends ChangeNotifier {
  final SearchMovieRepository _searchMovieRepository;

  MovieListViewModel(this._searchMovieRepository);

  LoadingState<MovieListData>? state;
  SearchMovieResponse? _response;
  int _page = 0;
  List<Result> results = [];

  bool isReadMore = false;

  String _searchWord = "";
  String get searchWord => _searchWord;

  SearchMovieResponse? get response => _response;

  bool hasApiError = false;
  String? errorMessage;

  void setSearchWord(String searchWord) {
    _searchWord = searchWord;
  }

  Future<void> fetchMovies() async {
    results = [];
    state = const LoadingState.loading();
    notifyListeners();
    return await _searchMovieRepository.fetchMovieList(searchWord)
        .then((response) {
          response.when(
            success: (SearchMovieResponse response) {
              state = LoadingState.data(data: MovieListData(response.page, response.results, response.totalResults));
            _response = response;
            _page = response.page;
            results += response.results;
            notifyListeners();

            // hasApiError = false;
            // errorMessage = null;
          },
            failure: (NetworkError error) {
              state = LoadingState.error(error: error);
              notifyListeners();
              // hasApiError = true;
              // errorMessage = error.errorMessage;
          });
        });
        // .catchError((dynamic error) { errorMessage = error.toString();})
        // .whenComplete(() => notifyListeners());
  }

  Future<void> readMoreMovies() async {
    state = const LoadingState.loading();
    isReadMore = true;
    return await _searchMovieRepository.fetchMovieList(searchWord, page: _page + 1)
        .then((response) {
          response.when(
              success: (SearchMovieResponse response) {
                state = LoadingState.data(data: MovieListData(response.page, results + response.results, response.totalResults));
                _response = response;
                _page = response.page;
                results += response.results;
                isReadMore = false;

                // _response = response;
                // _page = response.page;
                // results += response.results;
                // hasApiError = false;
                // errorMessage = null;
              },
              failure: (NetworkError error) {
                state = LoadingState.error(error: error);
                isReadMore = false;
                // hasApiError = true;
                // errorMessage = error.errorMessage;
              });
        })
        .catchError((dynamic error) { errorMessage = error.toString();})
        .whenComplete(() => notifyListeners());
  }

  // Future<ApiResult<SearchMovieResponse>> fetch() async {
  //   return _searchMovieRepository.fetchMovieList(searchWord);
  // }
}