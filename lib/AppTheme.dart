import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData themeData() {
    return ThemeData(
      textTheme: _textTheme,
    );
  }

  static const _superBold = FontWeight.w900;
  static const _bold = FontWeight.w700;
  static const _semiBold = FontWeight.w600;
  static const _medium = FontWeight.w500;
  static const _regular = FontWeight.w400;
  static const _light = FontWeight.w300;

  static final TextTheme _textTheme = TextTheme(
    button: GoogleFonts.montserrat(
      fontWeight: _semiBold,
      fontStyle: FontStyle.normal,
      fontSize: 14,
      letterSpacing: 1.25,
    ),
    headline5: GoogleFonts.montserrat(
      fontWeight: _semiBold,
      fontStyle: FontStyle.normal,
      fontSize: 24,
      letterSpacing: 0.15,
    ),
    headline6: GoogleFonts.montserrat(
      fontWeight: _medium,
      fontStyle: FontStyle.normal,
      fontSize: 20,
      letterSpacing: 0.15,
    ),
    subtitle1: GoogleFonts.montserrat(
      fontWeight: _regular,
      fontStyle: FontStyle.normal,
      fontSize: 16,
      letterSpacing: 0.15,
    ),
    subtitle2: GoogleFonts.montserrat(
      fontWeight: _medium,
      fontStyle: FontStyle.normal,
      fontSize: 14,
      letterSpacing: 0.1,
    ),
    caption: GoogleFonts.montserrat(
      fontWeight: _regular,
      fontStyle: FontStyle.normal,
      fontSize: 12,
      letterSpacing: 0.4,
    ),
    bodyText1: GoogleFonts.montserrat(
      fontWeight: _regular,
      fontStyle: FontStyle.normal,
      fontSize: 16,
      letterSpacing: 0.5,
    ),
    bodyText2: GoogleFonts.montserrat(
      fontWeight: _regular,
      fontStyle: FontStyle.normal,
      fontSize: 14,
      letterSpacing: 0.25,
    ),
  );
}
