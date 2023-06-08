import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyle {
  const CustomTextStyle._();

  static TextTheme textTheme = GoogleFonts.poppinsTextTheme().copyWith(
    bodyLarge: GoogleFonts.poppins(fontSize: 14),
    bodyMedium: GoogleFonts.poppins(fontSize: 12),
    bodySmall: GoogleFonts.poppins(fontSize: 10),
    titleLarge: GoogleFonts.poppins(fontSize: 20),
    titleMedium: GoogleFonts.poppins(fontSize: 18),
    titleSmall: GoogleFonts.poppins(fontSize: 16),
  );
}
