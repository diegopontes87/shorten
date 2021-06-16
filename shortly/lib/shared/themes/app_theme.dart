import 'package:flutter/material.dart';
import 'package:shortly/shared/res/app_colors.dart';

import 'app_text_themes.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.white,
      colorScheme: ColorScheme(
        primary: AppColors.cyan,
        primaryVariant: AppColors.darkViolet,
        secondary: AppColors.lightGrey,
        secondaryVariant: AppColors.white,
        surface: AppColors.offWhite,
        background: AppColors.white,
        error: AppColors.red,
        onPrimary: AppColors.white,
        onSecondary: AppColors.black,
        onSurface: AppColors.gray,
        onBackground: AppColors.grayishViolet,
        onError: AppColors.red,
        brightness: Brightness.light,
      ),
      textTheme: AppTextTheme.getTextLightTheme,
    );
  }
}
