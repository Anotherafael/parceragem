import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTypography {
  static final TextStyle normalPrimary = GoogleFonts.montserrat(
    fontSize: 16,
    color: Colors.black,
  );
  static final TextStyle normalPrimaryWhite = GoogleFonts.montserrat(
    fontSize: 16,
    color: Colors.white,
  );
  static final TextStyle dropDownPrimary = GoogleFonts.montserrat(
    fontSize: 12,
  );
  static final TextStyle buttonPrimary = GoogleFonts.montserrat(
    fontSize: 24,
  );

  static final TextStyle titlePage = GoogleFonts.montserrat(
    color: AppColors.white,
    fontWeight: FontWeight.w600,
    fontSize: 24,
  );

  static final TextStyle titleCard = GoogleFonts.montserrat(
    color: AppColors.whiteColor,
    fontSize: 16,
  );

  static final TextStyle subtitleCard = GoogleFonts.montserrat(
    color: AppColors.whiteColor,
    fontSize: 14,
  );

  static final TextStyle providerCard = GoogleFonts.montserrat(
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w500,
    fontSize: 20,
  );

  static final TextStyle errorInput = GoogleFonts.montserrat(
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w400,
    fontSize: 10,
  );

  static final TextStyle orderSelectCard = GoogleFonts.montserrat(
    color: AppColors.white,
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );
}
