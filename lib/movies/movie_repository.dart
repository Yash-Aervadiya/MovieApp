import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/movies/movies_exceptions.dart';

import '../environment_config.dart';
import '../services/dio_client.dart';
import 'movie_modal.dart';

class MovieRepository {
  MovieRepository(this._read, this._environmentConfig);

  final Reader _read;
  final EnvironmentConfig _environmentConfig;

  Future<List<Movie>> getMovies() async {
    try {
      final DioClient _dioClient = DioClient();
      final response = await _dioClient.get(
          'https://api.themoviedb.org/3/movie/popular?api_key=${_environmentConfig.movieApiKey}&language=en-US');

      final results = List<Map<String, dynamic>>.from(response.data['results']);

      List<Movie> movies = results.map((e) => Movie.fromMap(e)).toList();
      return movies;
    } on DioError catch (e) {
      throw MoviesException.fromDioError(e);
    }
  }
}
