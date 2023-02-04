import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SpTextStyles {
  SpTextStyles._();

  static final TextStyle header = GoogleFonts.ibmPlexSans(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );

  static final TextStyle bodyRegular14 = GoogleFonts.ibmPlexSans(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle bodyRegular12 = GoogleFonts.ibmPlexSans(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    height: 1.4,
  );

  static final TextStyle bodyMedium14 = GoogleFonts.ibmPlexSans(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
}
