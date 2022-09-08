import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_app/movies/movie_modal.dart';
import 'package:movie_app/utils/app_colors.dart';
import 'package:movie_app/utils/app_text_styles.dart';
import 'package:movie_app/widgets/app_widgets.dart';

import 'movie_rating.dart';

class MovieTile extends StatelessWidget {
  bool isTopMovie;
  Movie movie;
  MovieTile({Key? key, required this.isTopMovie, required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
            color:
                isTopMovie ? AppColors.blueColor : AppColors.movieTileBgColor,
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
              child: AppWidgets.imageFromNetworkWidget(movie.fullImageUrl),

              // Image.network(
              //   movie.fullImageUrl,
              // ),
            ),
            Expanded(flex: 2, child: movieInfo()),
          ],
        ),
      ),
    );
  }

  Widget movieInfo() {
    var releaseList = movie.releaseDate.split('-');
    final String releaseYear = releaseList[0];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isTopMovie ? topMovieThisWeek() : const SizedBox(), //Movie Title
          Text(
            movie.title,
            style:
                AppTextStyles.appTextStyle(color: Colors.white, fontSize: 16),
          ),

          const SizedBox(height: 8),
          //Movie Genre
          Text(
            'Fantasy / Action',
            style: AppTextStyles.appTextStyle(
                color: AppColors.grayTextColor, fontSize: 12),
          ),
          const SizedBox(height: 4),

          //Movie release year

          Row(
            children: [
              Text(
                releaseYear,
                style: AppTextStyles.appTextStyle(
                    color: AppColors.grayTextColor, fontSize: 12),
              ),

              //Movie Duration
              Text(
                ' • 1h 44m',
                style: AppTextStyles.appTextStyle(
                    color: AppColors.grayTextColor, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 12),

          ratingInfo(),
        ],
      ),
    );
  }

  Widget ratingInfo() {
    final double ratings = movie.ratings / 2;
    return Container(
      decoration: BoxDecoration(
          color: isTopMovie ? Colors.blue.shade500 : AppColors.lighterGrayColor,
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

  Widget topMovieThisWeek() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset('assets/images/goldmedal.png'),
          const SizedBox(width: 8),
          Text(
            'Top movie this week',
            style: AppTextStyles.appTextStyle(
                color: AppColors.grayTextColor, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
