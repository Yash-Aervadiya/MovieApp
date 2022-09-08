import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../utils/app_colors.dart';

class AppWidgets {
  static Widget imageFromNetworkWidget(
    String imageUrl, {
    BoxFit? fit,
    double? height,
    double? width,
    Key? key,
  }) {
    return CachedNetworkImage(
      key: key,
      imageUrl: imageUrl,
      placeholder: (context, _) {
        return SizedBox.shrink(child: Container(color: Colors.transparent));
      },
      errorWidget: (context, _, __) {
        return SizedBox.shrink(
            child: Container(color: AppColors.lighterGrayColor));
      },
      fit: fit ?? BoxFit.fill,
      height: height,
      width: width,
    );
  }
}
