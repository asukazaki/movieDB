import 'package:moviedb/db/AppDatabase.dart';

import 'MylistMovieDto.dart';

class MylistRepository {
  late AppDatabase _db;

  MylistRepository({AppDatabase? db}) {
    _db = db ?? AppDatabase();
  }

  Future<List<MylistMovieDto>> getAllMylist() async {
    return _db.getAllMylist();
  }

  Future<void> addMylist(MylistMovieDto dto) async {
    _db.insert(dto);
  }

  Future<void> updateMylist(MylistMovieDto dto) async {
    return _db.update(dto);
  }

  Future<void> deleteMylist(int id) async {
    return _db.delete(id);
  }

  Future<bool> existsMylist(int id) async {
    final dtos = await _db.search(id);
    if (dtos.isEmpty) {
      return false;
    } else {
      return true;
    }
  }
}