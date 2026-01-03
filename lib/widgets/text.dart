import 'package:illustration_based_portfolio/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  const TextWidget({
    super.key,
    required this.text,
    this.size,
    this.color,
    this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 10,
      style: TextStyle(
        color: color ?? AppColors.black,
        fontSize: size ?? 20,
        fontWeight: weight ?? FontWeight.w600,
        fontFamily: GoogleFonts.sora().fontFamily,
      ),
    );
  }
}
