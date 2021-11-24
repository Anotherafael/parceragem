import 'package:flutter/material.dart';

Color fromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}

class AppColors {
  // Light Color
  static Color colorLightPrimary = fromHex("#2A4494");
  static Color colorLightSecondary = fromHex("#224870");
  static Color colorLightCardColors = fromHex("#44CFCB");
  // #Light Color

// Light Color
  static const Color colorDarkPrimary = Color(0xFF222831);
  static const Color colorDarkSecondary = Color(0xFF30475E);
  static const Color colorDarkThird = Color(0xFFF2A365);
  static const Color colorDarkTitle = Color(0xFFECECEC);
  // #Light Color

  // Get Started
  static const Color colorStarted = Color(0xFF274C71);
  static const Color colorStartedTitle = Color(0xFF352641);
  static const Color colorStartedDescription = Color(0xFF767676);
  static const Color colorStartedShadow = Color(0x60274C71);
  // #Get Started

  // Alert Dialog
  static const Color colorAlertDialogBack = Color(0xFFF8F7F2);
  // #Alert Dialog
}
