import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFF0D0C0C),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF0D0C0C),
      primaryContainer: Color(0xFF161616),
      tertiaryContainer: Color.fromARGB(255, 29, 29, 29),
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.nunito(
        fontSize: 63,
        fontWeight: FontWeight.bold,
        letterSpacing: -1.5,
        color: const Color(0xFF9F37B0),
      ),
      displayMedium: GoogleFonts.nunito(
        fontSize: 63,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.5,
        color: Colors.white,
      ),
      displaySmall: GoogleFonts.nunito(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headlineMedium: GoogleFonts.nunito(
        fontSize: 36,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      ),
      headlineSmall: GoogleFonts.nunito(
        fontSize: 32,
        fontWeight: FontWeight.w400,
        color: const Color(0xFF9F37B0),
      ),
      titleLarge: GoogleFonts.nunito(
        fontSize: 32,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
        color: const Color(0xFFA8B2C8),
      ),
      titleMedium: GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
        color: Colors.white,
      ),
      titleSmall: GoogleFonts.nunito(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: const Color.fromARGB(255, 231, 227, 227),
      ),
      labelLarge: GoogleFonts.roboto(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.25,
        color: Colors.white,
      ),
      bodySmall: GoogleFonts.roboto(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
      ),
      labelSmall: GoogleFonts.roboto(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5,
        color: const Color(0xFFDBDFE8),
      ),
    ),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(
      primary: Colors.white,
      primaryContainer: Color.fromARGB(255, 239, 236, 241),
      tertiaryContainer: Color.fromARGB(255, 239, 236, 241),
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.nunito(
        fontSize: 63,
        fontWeight: FontWeight.bold,
        letterSpacing: -1.5,
        color: const Color(0xFF9F37B0),
      ),
      displayMedium: GoogleFonts.nunito(
        fontSize: 63,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.5,
        color: const Color(0xFF3A4357),
      ),
      displaySmall: GoogleFonts.nunito(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: const Color(0xFF3A4357),
      ),
      headlineMedium: GoogleFonts.nunito(
        fontSize: 36,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      ),
      headlineSmall: GoogleFonts.nunito(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: const Color(0xFF9F37B0),
      ),
      titleLarge: GoogleFonts.nunito(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.15,
        color: const Color(0xFF3A4357),
      ),
      titleMedium: GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
        color: const Color(0xFF3A4357),
      ),
      titleSmall: GoogleFonts.nunito(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: Colors.black,
      ),
      labelLarge: GoogleFonts.roboto(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.25,
        color: Colors.white,
      ),
      bodySmall: GoogleFonts.roboto(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
      ),
      labelSmall: GoogleFonts.roboto(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5,
        color: const Color(0xFFDBDFE8),
      ),
    ),
  );
}
