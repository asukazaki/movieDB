import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moviedb/db/MylistMovieDto.dart';
import 'package:moviedb/db/MylistRepository.dart';
import 'package:moviedb/list/MovieListViewModel.dart';

import '../api/LoadingState.dart';

final mylistMovieProvider = ChangeNotifierProvider((ref) => MylistProvider(MylistRepository()));

class MylistProvider extends ChangeNotifier {
  final MylistRepository _mylistRepository;

  MylistProvider(this._mylistRepository) {
    load();
  }

  LoadingState<List<MovieListItem>>? state;
  List<MylistMovieDto> _mylists = [];
  bool isMylist = false;

  Future<void> load() async {
    state = const LoadingState.loading();
    notifyListeners();
    await _mylistRepository.getAllMylist().then((mylists) {
      _mylists = mylists;
      state = LoadingState.data(
          data: mylists.map((e) => MovieListItem(id: e.id, title: e.title, posterPath: e.posterPath, releaseDate: e.releaseDate, overview: e.overview)).toList()
      );
      notifyListeners();
    });
  }

  Future<void> addMylist(MovieListItem item) async {
    state = const LoadingState.loading();
    notifyListeners();
    final dto = MylistMovieDto(
        id: item.id,
        title: item.title,
        posterPath: item.posterPath,
        releaseDate: item.releaseDate,
        overview: item.overview);
    await _mylistRepository.addMylist(dto);
    _mylists.add(dto);
    state = LoadingState.data(
        data: _mylists.map((e) => MovieListItem(id: e.id, title: e.title, posterPath: e.posterPath, releaseDate: e.releaseDate, overview: e.overview)).toList()
    );
    notifyListeners();
  }

  Future<void> deleteMylist(int id) async {
    state = const LoadingState.loading();
    notifyListeners();
    await _mylistRepository.deleteMylist(id);
    if (_mylists.where((element) => element.id == id).isNotEmpty) {
      isMylist = false;
    }
    _mylists = _mylists.where((element) => element.id != id).toList();
    state = LoadingState.data(
        data: _mylists.map((e) => MovieListItem(id: e.id, title: e.title, posterPath: e.posterPath, releaseDate: e.releaseDate, overview: e.overview)).toList()
    );
    
    notifyListeners();
  }

  Future<void> existsMylist(int id) async {
    final exists = await _mylistRepository.existsMylist(id);
    isMylist = exists;
    notifyListeners();
  }

  Future<void> toggleMylist(MovieListItem item) async {
    if (isMylist) {
      await deleteMylist(item.id);
      isMylist = false;
      notifyListeners();
    } else {
      await addMylist(item);
      isMylist = true;
      notifyListeners();
    }
  }
}