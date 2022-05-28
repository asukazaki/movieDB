import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moviedb/api/LoadingState.dart';
import 'package:moviedb/api/person/PersonMovieCreditsRepository.dart';
import 'package:moviedb/api/person/PersonMovieCreditsResponse.dart';
import 'package:moviedb/api/search_movie/SearchMovieRepository.dart';

import '../api/NetworkError.dart';
import '../api/search_movie/SearchMovieResponse.dart';

final movieListViewModelProvider = ChangeNotifierProvider((ref) => MovieListViewModel(SearchMovieRepository(), PersonMovieCreditsRepository()));

class MovieListData {
  int page;
  List<MovieListItem> results;
  int totalResults;

  MovieListData(this.page, this.results, this.totalResults);
}

class MovieListItem {
  int id;
  String? title;
  String? posterPath;
  String? releaseDate;
  String? overview;

  MovieListItem({required this.id, required this.title, required this.posterPath, required this.releaseDate, required this.overview});
}

class MovieListViewModel extends ChangeNotifier {
  final SearchMovieRepository _searchMovieRepository;
  final PersonMovieCreditsRepository _personMovieCreditsRepository;

  MovieListViewModel(this._searchMovieRepository, this._personMovieCreditsRepository);

  LoadingState<MovieListData>? state;

  List<MovieListData> _listItems = [];
  int currentMovieListIndex = 0;
  int? totalHits;

  bool isReadMore = false;

  bool _isQuerySearch = true;

  String _searchWord = "";
  String get searchWord => _searchWord;

  void setSearchWord(String searchWord) {
    _searchWord = searchWord;
  }

  void setCurrentIndexItems() {
    if (_listItems.isEmpty) {
      return;
    }
    totalHits = _listItems[currentMovieListIndex].totalResults;
    state = LoadingState.data(data: _listItems[currentMovieListIndex]);
    notifyListeners();
  }

  void resetListItem() {
    _listItems.removeAt(currentMovieListIndex);
    if (currentMovieListIndex != 0) {
      currentMovieListIndex --;
    }
  }

  Future<void> fetchMovies({bool shouldReset = false}) async {
    _isQuerySearch = true;
    if (shouldReset) {
      _listItems = [];
    }
    state = const LoadingState.loading();
    notifyListeners();

    return await _searchMovieRepository.fetchMovieList(searchWord)
        .then((response) {
          response.when(
            success: (SearchMovieResponse response) {
              List<MovieListItem> items = response.results.map((e){
                return MovieListItem(id: e.id, title: e.title, posterPath: e.posterPath, releaseDate: e.releaseDate, overview: e.overview);
              }).toList();
              _listItems.add(MovieListData(response.page, items, response.totalResults));
              state = LoadingState.data(data: _listItems[currentMovieListIndex]);
              totalHits = _listItems[currentMovieListIndex].totalResults;
            notifyListeners();
          },
            failure: (NetworkError error) {
              state = LoadingState.error(error: error);
              notifyListeners();
          });
        });
  }

  Future<void> fetchPersonMovie({required int id, bool shouldReset = false}) async {
    _isQuerySearch = false;
    if (shouldReset) {
      _listItems = [];
    }
    if (_listItems.isNotEmpty) {
      currentMovieListIndex ++;
    }
    state = const LoadingState.loading();
    notifyListeners();

    return await _personMovieCreditsRepository.fetch(id)
        .then((response) {
      response.when(
          success: (PersonMovieCreditsResponse response) {
            final casts = response.cast;
            if (casts == null) {
              state = const LoadingState.error(error: NetworkError.unexpectedError());
              return;
            }
            List<MovieListItem> items = casts.map((e){
              return MovieListItem(id: e.id!, title: e.title, posterPath: e.posterPath, releaseDate: e.releaseDate, overview: e.overview);
            }).toList();
            _listItems.add(MovieListData(1, items, items.length));
            state = LoadingState.data(data: _listItems[currentMovieListIndex]);
            totalHits = _listItems[currentMovieListIndex].totalResults;
            notifyListeners();
          },
          failure: (NetworkError error) {
            state = LoadingState.error(error: error);
            notifyListeners();
          });
    });
  }

  Future<void> readMoreMovies() async {
    if (!_isQuerySearch) {
      return;
    }
    state = const LoadingState.loading();
    isReadMore = true;
    return await _searchMovieRepository.fetchMovieList(searchWord, page: _listItems[currentMovieListIndex].page + 1)
        .then((response) {
          response.when(
              success: (SearchMovieResponse response) {
                List<MovieListItem> items = response.results.map((e){
                  return MovieListItem(id: e.id, title: e.title, posterPath: e.posterPath, releaseDate: e.releaseDate, overview: e.overview);
                }).toList();

                _listItems[currentMovieListIndex].page = response.page;
                _listItems[currentMovieListIndex].results += items;

                state = LoadingState.data(data: _listItems[currentMovieListIndex]);

                isReadMore = false;
                notifyListeners();
              },
              failure: (NetworkError error) {
                state = LoadingState.error(error: error);
                isReadMore = false;
                notifyListeners();
              });
        });

  }

}