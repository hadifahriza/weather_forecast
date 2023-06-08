import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyle {
  const CustomTextStyle._();

  static TextTheme textTheme = GoogleFonts.poppinsTextTheme().copyWith(
    bodyLarge: GoogleFonts.poppins(fontSize: 16),
    bodyMedium: GoogleFonts.poppins(fontSize: 14),
    bodySmall: GoogleFonts.poppins(fontSize: 12),
    titleLarge: GoogleFonts.poppins(fontSize: 22),
    titleMedium: GoogleFonts.poppins(fontSize: 20),
    titleSmall: GoogleFonts.poppins(fontSize: 18),
    headlineLarge: GoogleFonts.poppins(fontSize: 28),
    headlineMedium: GoogleFonts.poppins(fontSize: 26),
    headlineSmall: GoogleFonts.poppins(fontSize: 24),
  );
}
