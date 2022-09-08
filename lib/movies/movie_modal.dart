import 'dart:convert';

class Movie {
  String title;
  String posterPath;
  String backdropPath;
  String overview;
  String releaseDate;
  num ratings;

  Movie({
    required this.title,
    required this.posterPath,
    required this.backdropPath,
    required this.overview,
    required this.releaseDate,
    required this.ratings,
  });

  String get fullImageUrl => 'https://image.tmdb.org/t/p/w200/$posterPath';

  String get fullIPostermageUrl =>
      'https://image.tmdb.org/t/p/original/$posterPath';

  String get bigPosterFullImageUrl =>
      'https://image.tmdb.org/t/p/original/$backdropPath';

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'poster_path': posterPath,
      'backdrop_path': backdropPath,
      'vote_average': ratings,
      'overview': overview,
      'release_date': releaseDate,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      title: map['title'] ?? '',
      posterPath: map['poster_path'] ?? '',
      backdropPath: map['backdrop_path'] ?? '',
      ratings: map['vote_average'] ?? '',
      overview: map['overview'] ?? '',
      releaseDate: map['release_date'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source));
}
