import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shortly/shared/extensions/app_sizes_extensions.dart';
import 'package:shortly/shared/res/base_res_files/app_colors.dart';

class AppTextTheme {
  static TextTheme get getTextLightTheme {
    return TextTheme(
      headline1: GoogleFonts.poppins(
        fontSize: 35.propHeight(),
        fontWeight: FontWeight.w700,
        color: AppColors.grayishViolet,
        height: 1.3,
      ),
      headline2: GoogleFonts.poppins(
        fontSize: 32.propHeight(),
        fontWeight: FontWeight.w700,
        color: AppColors.grayishViolet,
        height: 1.3,
      ),
      headline3: GoogleFonts.poppins(
        fontSize: 20.propHeight(),
        fontWeight: FontWeight.w700,
        color: AppColors.grayishViolet,
        height: 1.3,
      ),
      headline4: GoogleFonts.poppins(
        fontSize: 17.propHeight(),
        fontWeight: FontWeight.w700,
        color: AppColors.grayishViolet,
        height: 1.3,
      ),
      bodyText1: GoogleFonts.poppins(
        fontSize: 17.propHeight(),
        fontWeight: FontWeight.w500,
        color: AppColors.grayishViolet,
        height: 1.3,
      ),
    );
  }
}
