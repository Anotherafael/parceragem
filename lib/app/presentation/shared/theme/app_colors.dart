import 'package:flutter/material.dart';

class AppColors {
  // Older Version
  static const Color primaryColor = Color(0xFF2A4494);
  static const Color secondaryColor = Color(0xFF224870);
  static const Color primaryAlt = Color(0xFF44CFCB);
  static const Color secondaryAlt = Color(0xFF4EA5D9);
  static const Color darkColor = Color(0xFF122C34);
  static const Color whiteColor = Color(0xFFFFFFFF);

  // New Version
  static const Color primary = Color(0xFF4A88F0);

  static const Color primaryCard = Color(0xFF41CAF8);
  static const Color primaryCardAlt = Color(0xFF4EA5D9);

  static const LinearGradient blueCardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      AppColors.primaryCard,
      AppColors.primaryCardAlt,
    ],
  );

  static const Color secondaryCard = Color(0xFF4C74F5);
  static const Color secondaryCardAlt = Color(0xFF5938D9);

  static const LinearGradient violetCardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      AppColors.primaryCardAlt,
      AppColors.secondaryCardAlt,
    ],
  );

  static const Color success = Color(0xFF0EB0EB);
  static const Color successAlt = Color(0xFF269FFF);

  static const LinearGradient successGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      AppColors.success,
      AppColors.successAlt,
    ],
  );

  static const Color danger = Color(0xFFFE4236);
  static const Color dangerAlt = Color(0xFFEA330D);

  static const LinearGradient dangerGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[
      AppColors.danger,
      AppColors.dangerAlt,
    ],
  );

  static const Color modal = Color(0xFF2A4494);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
}
