import 'package:flutter/material.dart';
import 'package:shortly/shared/res/app_colors.dart';

import 'app_text_themes.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.white,
      colorScheme: ColorScheme(
        primary: AppColors.baseGreen,
        primaryVariant: AppColors.transparent,
        secondary: AppColors.basePink,
        secondaryVariant: AppColors.lightPink,
        surface: AppColors.white,
        background: AppColors.white,
        error: AppColors.error,
        onPrimary: AppColors.white,
        onSecondary: AppColors.black,
        onSurface: AppColors.black,
        onBackground: AppColors.black,
        onError: AppColors.white,
        brightness: Brightness.light,
      ),
      textTheme: AppTextTheme.getTextTheme,
    );
  }
}
