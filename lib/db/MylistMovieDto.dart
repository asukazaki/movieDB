
class MylistMovieDto {
  final int id;
  // final int movieId;
  final String? title;
  final String? posterPath;
  final String? releaseDate;
  final String? overview;

  MylistMovieDto({required this.id, required this.title, required this.posterPath, required this.releaseDate, required this.overview});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'posterPath': posterPath,
      'releaseDate': releaseDate,
      'overview': overview,
    };
  }
}