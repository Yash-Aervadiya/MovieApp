import 'package:flutter/material.dart';
import 'package:movie_app/utils/app_text_styles.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Coming Soon.. ⏱',
        style: AppTextStyles.appTextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
