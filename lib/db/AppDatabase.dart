import 'package:moviedb/api/LoadingState.dart';
import 'package:moviedb/db/MylistMovieDto.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  late Database _database;
  final String _tableName = 'movie';

  Future<Database> get database async {
    _database = await initializeDatabase();
    return _database;
  }

  Future<Database> initializeDatabase() async {
    final database = openDatabase(
        join(await getDatabasesPath(), 'database.db'),
        onCreate: _onCreate,
        version: 1
    );
    return database;
  }

  void _onCreate(Database database, int version) async {
    return database.execute(
        'CREATE TABLE movie(id INTEGER PRIMARY KEY, title TEXT, posterPath TEXT, releaseDate TEXT, overview TEXT)'
    );
  }

  Future<List<MylistMovieDto>> getAllMylist() async {
    final db = await database;
    final maps = await db.query(
      _tableName,
      orderBy: 'id DESC',
    );

    if (maps.isEmpty) return [];

    return maps.map((map) =>
        MylistMovieDto(
            id: map['id'] as int,
            title: map['title'] as String?,
            posterPath: map['posterPath'] as String?,
            releaseDate: map['releaseDate'] as String?,
            overview: map['overview'] as String?
        )).toList();
  }

  Future<void> insert(MylistMovieDto dto) async {
    final db = await database;

    await db.insert(
      _tableName,
      dto.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future update(MylistMovieDto dto) async {
    final db = await database;

    return await db.update(
      _tableName,
      dto.toMap(),
      where: 'id = ?',
      whereArgs: [dto.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future delete(int id) async {
    final db = await database;

    return await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<MylistMovieDto>> search(int id) async {
    final db = await database;

    final maps = await db.query(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );

    return maps.map((map) =>
        MylistMovieDto(
            id: map['id'] as int,
            title: map['title'] as String?,
            posterPath: map['posterPath'] as String?,
            releaseDate: map['releaseDate'] as String?,
            overview: map['overview'] as String?
        )).toList();
  }
}

void _onUpgrade(Database database, int version) async {

}

