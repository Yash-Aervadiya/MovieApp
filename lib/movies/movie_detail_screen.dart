import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../movies/movie_modal.dart';
import '../movies/movie_provider.dart';
import '../utils/app_colors.dart';
import '../utils/app_strings.dart';
import '../utils/app_text_styles.dart';
import '../widgets/app_widgets.dart';
import '../widgets/error_widget.dart';
import '../widgets/movie_widgets/movie_rating.dart';
import '../widgets/movie_widgets/movie_tile.dart';
import 'movies_exceptions.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;
  final bool isTopMovie;

  const MovieDetailScreen(
      {Key? key, required this.movie, required this.isTopMovie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            bigPosterWidget(context),
            alsoTranding(),
          ],
        ),
      ),
    );
  }

  Widget bigPosterWidget(BuildContext context) {
    return Stack(
      children: [
        Container(
          foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Colors.black.withOpacity(0.3),
                Colors.black,
              ])),
          child: AppWidgets.imageFromNetworkWidget(
            movie.fullIPostermageUrl,
            width: MediaQuery.of(context).size.width,
            // fit: BoxFit.cover,
          ),
        ),
        Positioned(
          left: 20,
          top: 40,
          child: GestureDetector(
            onTap: (() => Navigator.of(context).pop()),
            child: const Icon(Icons.arrow_back, color: Colors.white, size: 24),
          ),
        ),
        Positioned(left: 0, bottom: 0, right: 0, child: movieInfo()),
      ],
    );
  }

  Widget movieInfo() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isTopMovie)
            Padding(
              padding: const EdgeInsets.only(right: 16.0, top: 5.0),
              child: Image.asset(AppStrings.goldMedalLarge),
            ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: AppTextStyles.appTextStyle(
                      color: Colors.white, fontSize: 28),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      '2019',
                      style: AppTextStyles.appTextStyle(
                          color: AppColors.grayTextColor, fontSize: 16),
                    ),
                    Text(
                      ' • Fantasy / Action',
                      style: AppTextStyles.appTextStyle(
                          color: AppColors.grayTextColor, fontSize: 16),
                    ),
                    //Movie Duration
                    Text(
                      ' • 1h 44m',
                      style: AppTextStyles.appTextStyle(
                          color: AppColors.grayTextColor, fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  movie.overview,
                  style: AppTextStyles.appTextStyle(
                      color: AppColors.grayTextColor, fontSize: 16),
                ),
                const SizedBox(height: 16),
                ratingInfo(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget ratingInfo() {
    final double ratings = movie.ratings / 2;
    return Container(
      decoration: BoxDecoration(
          color: AppColors.lighterGrayColor,
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: StarRating(
          rating: ratings,
          color: AppColors.yellowColor,
        ),
      ),
    );
  }

  Widget alsoTranding() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 32),
          Text(
            AppStrings.alsoTrending,
            style:
                AppTextStyles.appTextStyle(color: Colors.white, fontSize: 22),
          ),
          AlsoTrendingMovieList(
            movie: movie,
          ),
        ],
      ),
    );
  }
}

class AlsoTrendingMovieList extends ConsumerWidget {
  final Movie movie;
  const AlsoTrendingMovieList({Key? key, required this.movie})
      : super(key: key);

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
              if (movies[index].title == movie.title) {
                return const SizedBox();
              }
              return MovieTile(movie: movies[index], isTopMovie: false);
            },
          );
        });
  }
}
