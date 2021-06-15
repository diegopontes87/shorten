import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shortly/shared/extensions/app_sizes_extensions.dart';
import 'package:shortly/shared/res/app_colors.dart';

class AppTextTheme {
  static TextTheme getTextTheme(BuildContext context) {
    return TextTheme(
      headline1: GoogleFonts.inter(
        fontSize: 35.propHeight(),
        fontWeight: FontWeight.w700,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      headline2: GoogleFonts.inter(
        fontSize: 32.propHeight(),
        fontWeight: FontWeight.w700,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      headline3: GoogleFonts.inter(
        fontSize: 20.propHeight(),
        fontWeight: FontWeight.w700,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      headline4: GoogleFonts.inter(
        fontSize: 17.propHeight(),
        fontWeight: FontWeight.w700,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      bodyText1: GoogleFonts.inter(
        fontSize: 17.propHeight(),
        fontWeight: FontWeight.w500,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }
}
