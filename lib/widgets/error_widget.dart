import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../movies/movie_provider.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class ErrorBody extends ConsumerWidget {
  const ErrorBody({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.3),
          Text(
            message,
            style: AppTextStyles.appTextStyle(
                color: AppColors.grayTextColor, fontSize: 12),
          ),
          ElevatedButton(
            onPressed: () => ref.refresh(MoviesFutureProvider),
            child: const Text("Try again"),
          ),
        ],
      ),
    );
  }
}
