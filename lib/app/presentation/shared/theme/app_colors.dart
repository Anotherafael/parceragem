import 'package:flutter/material.dart';

Color fromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}

class AppColors {
// Light Color
  static const Color primaryColor = Color(0xFF2A4494);
  static const Color secondaryColor = Color(0xFF224870);
  static const Color primaryAlt = Color(0xFF44CFCB);
  static const Color secondaryAlt = Color(0xFF4EA5D9);
  static const Color darkColor = Color(0xFF122C34);
  static const Color whiteColor = Color(0xFFFFFFFF);
  // #Light Color
}
