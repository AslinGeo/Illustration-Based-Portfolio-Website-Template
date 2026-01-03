import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:illustration_based_portfolio/core/app_colors.dart';

class OutlineTextPainter extends CustomPainter {
  final String text;

  OutlineTextPainter(this.text);

  @override
  void paint(Canvas canvas, Size size) {
    final strokePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..color = AppColors.black;

    final fillPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white;

    final textStyleStroke = TextStyle(
      fontSize: 48,
      fontFamily: GoogleFonts.sora().fontFamily,
      foreground: strokePaint,
    );

    final textStyleFill = TextStyle(
      fontSize: 48,
      fontFamily: GoogleFonts.sora().fontFamily,
      foreground: fillPaint,
    );

    final strokeText = TextPainter(
      text: TextSpan(text: text, style: textStyleStroke),
      textDirection: TextDirection.ltr,
    );

    final fillText = TextPainter(
      text: TextSpan(text: text, style: textStyleFill),
      textDirection: TextDirection.ltr,
    );

    strokeText.layout();
    fillText.layout();

    strokeText.paint(canvas, Offset.zero);
    fillText.paint(canvas, Offset.zero);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

