import 'package:flutter/material.dart';
import 'package:flutter_graduation_app/style/app_color.dart';

class AppTextStyles {
  static const TextStyle title = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w700,
    color: AppColors.title,
    letterSpacing: 0.3,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 15.5,
    color: AppColors.secondaryText,
    height: 1.6,
  );
  static const TextStyle skip =
      TextStyle(color: AppColors.secondaryText, fontSize: 14);
}
