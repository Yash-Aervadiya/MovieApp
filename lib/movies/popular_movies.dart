import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/widgets/error_widget.dart';

import '../utils/app_colors.dart';
import '../utils/app_strings.dart';
import '../utils/app_text_styles.dart';
import '../widgets/movie_widgets/movie_tile.dart';
import 'movie_detail_screen.dart';
import 'movie_modal.dart';
import 'movie_provider.dart';
import 'movies_exceptions.dart';

class PopularMovies extends StatefulWidget {
  const PopularMovies({Key? key}) : super(key: key);

  @override
  State<PopularMovies> createState() => _PopularMoviesState();
}

class _PopularMoviesState extends State<PopularMovies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * .08),
              headerWidget(),
              const MovieList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget headerWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppStrings.topMovies,
          style: AppTextStyles.appTextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const Icon(
          Icons.search,
          color: Colors.white,
          size: 22,
        )
      ],
    );
  }
}

class MovieList extends ConsumerWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(MoviesFutureProvider).when(
        error: (e, s) {
          if (e is MoviesException) {
            return ErrorBody(message: e.message!);
          }
          return const Center(
            child: ErrorBody(message: "Error"),
          );
        },
        loading: () => Center(
                child: CircularProgressIndicator(
              color: AppColors.blueColor,
            )),
        data: (movies) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: movies.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                  onTap: () => _navigateToMovieDetailScreen(
                      context, movies[index], index == 0),
                  child:
                      MovieTile(movie: movies[index], isTopMovie: index == 0));
            },
          );
        });
  }

  void _navigateToMovieDetailScreen(
      BuildContext context, Movie movie, bool isTopMovie) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) =>
            MovieDetailScreen(movie: movie, isTopMovie: isTopMovie)));
  }
}
