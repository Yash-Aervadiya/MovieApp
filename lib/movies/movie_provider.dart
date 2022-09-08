import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/environment_config.dart';
import 'package:movie_app/movies/movie_repository.dart';

import 'movie_modal.dart';

final MovieRepositoryProvider = Provider<MovieRepository>((ref) {
  final config = ref.read(environmentConfigProvider);

  return MovieRepository(ref.read, config);
});

final MoviesFutureProvider =
    FutureProvider.autoDispose<List<Movie>>((ref) async {
  ref.maintainState = true;
  final movieRepository = ref.read(MovieRepositoryProvider);
  return await movieRepository.getMovies();
});
