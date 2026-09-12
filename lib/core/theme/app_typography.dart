import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  const AppTypography._();

  static TextStyle headingLarge({required Color color, bool isArabic = false}) {
    return isArabic
        ? GoogleFonts.cairo(
            fontSize: 44,
            fontWeight: FontWeight.w800,
            color: color,
            height: 1.2,
          )
        : GoogleFonts.spaceGrotesk(
            fontSize: 52,
            fontWeight: FontWeight.w800,
            color: color,
            height: 1.1,
            letterSpacing: -0.02,
          );
  }

  static TextStyle headingMedium({required Color color, bool isArabic = false}) {
    return isArabic
        ? GoogleFonts.cairo(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: color,
            height: 1.3,
          )
        : GoogleFonts.spaceGrotesk(
            fontSize: 34,
            fontWeight: FontWeight.w700,
            color: color,
            height: 1.2,
            letterSpacing: -0.01,
          );
  }

  static TextStyle headingSmall({required Color color, bool isArabic = false}) {
    return isArabic
        ? GoogleFonts.cairo(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: color,
            height: 1.4,
          )
        : GoogleFonts.spaceGrotesk(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: color,
            height: 1.3,
          );
  }

  static TextStyle bodyLarge({required Color color, bool isArabic = false}) {
    return isArabic
        ? GoogleFonts.cairo(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: color,
            height: 1.7,
          )
        : GoogleFonts.jetBrainsMono(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: color,
            height: 1.6,
          );
  }

  static TextStyle bodyMedium({required Color color, bool isArabic = false}) {
    return isArabic
        ? GoogleFonts.cairo(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: color,
            height: 1.6,
          )
        : GoogleFonts.jetBrainsMono(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: color,
            height: 1.5,
          );
  }

  static TextStyle code({required Color color, double fontSize = 13}) {
    return GoogleFonts.jetBrainsMono(
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      color: color,
      height: 1.5,
    );
  }

  static TextStyle tag({required Color color}) {
    return GoogleFonts.jetBrainsMono(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }
}
