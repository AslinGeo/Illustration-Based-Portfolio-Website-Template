import 'package:flutter/material.dart';

class Responsive {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width < 1024;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1024;
}

double responsiveFont(BuildContext context, double baseSize) {
  final width = MediaQuery.of(context).size.width;

  if (width < 600) {
    return baseSize * 0.85; // mobile
  } else if (width < 1200) {
    return baseSize; // tablet
  } else {
    return baseSize * 1.2; // desktop
  }
}

