class PersonMovieCreditsResponse {
  List<Cast>? cast;
  List<Crew>? crew;
  int? id;

  PersonMovieCreditsResponse({this.cast, this.crew, this.id});

  PersonMovieCreditsResponse.fromJson(Map<String, dynamic> json) {
    if (json['cast'] != null) {
      cast = <Cast>[];
      json['cast'].forEach((v) {
        cast!.add(new Cast.fromJson(v));
      });
    }
    if (json['crew'] != null) {
      crew = <Crew>[];
      json['crew'].forEach((v) {
        crew!.add(new Crew.fromJson(v));
      });
    }
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cast != null) {
      data['cast'] = this.cast!.map((v) => v.toJson()).toList();
    }
    if (this.crew != null) {
      data['crew'] = this.crew!.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    return data;
  }
}

class Cast {
  bool? adult;
  String? backdropPath;
  String? title;
  List<int>? genreIds;
  String? originalLanguage;
  String? originalTitle;
  String? posterPath;
  bool? video;
  double? voteAverage;
  String? overview;
  String? releaseDate;
  int? voteCount;
  int? id;
  double? popularity;
  String? character;
  String? creditId;
  int? order;

  Cast(
      {this.adult,
        this.backdropPath,
        this.title,
        this.genreIds,
        this.originalLanguage,
        this.originalTitle,
        this.posterPath,
        this.video,
        this.voteAverage,
        this.overview,
        this.releaseDate,
        this.voteCount,
        this.id,
        this.popularity,
        this.character,
        this.creditId,
        this.order});

  Cast.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    title = json['title'];
    genreIds = json['genre_ids'].cast<int>();
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    posterPath = json['poster_path'];
    video = json['video'];
    voteAverage = json['vote_average'];
    overview = json['overview'];
    releaseDate = json['release_date'];
    voteCount = json['vote_count'];
    id = json['id'];
    popularity = json['popularity'];
    character = json['character'];
    creditId = json['credit_id'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['title'] = this.title;
    data['genre_ids'] = this.genreIds;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['poster_path'] = this.posterPath;
    data['video'] = this.video;
    data['vote_average'] = this.voteAverage;
    data['overview'] = this.overview;
    data['release_date'] = this.releaseDate;
    data['vote_count'] = this.voteCount;
    data['id'] = this.id;
    data['popularity'] = this.popularity;
    data['character'] = this.character;
    data['credit_id'] = this.creditId;
    data['order'] = this.order;
    return data;
  }
}

class Crew {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;
  double? popularity;
  String? creditId;
  String? department;
  String? job;

  Crew(
      {this.adult,
        this.backdropPath,
        this.genreIds,
        this.id,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.posterPath,
        this.releaseDate,
        this.title,
        this.video,
        this.voteAverage,
        this.voteCount,
        this.popularity,
        this.creditId,
        this.department,
        this.job});

  Crew.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    popularity = json['popularity'];
    creditId = json['credit_id'];
    department = json['department'];
    job = json['job'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['genre_ids'] = this.genreIds;
    data['id'] = this.id;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['overview'] = this.overview;
    data['poster_path'] = this.posterPath;
    data['release_date'] = this.releaseDate;
    data['title'] = this.title;
    data['video'] = this.video;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    data['popularity'] = this.popularity;
    data['credit_id'] = this.creditId;
    data['department'] = this.department;
    data['job'] = this.job;
    return data;
  }
}
