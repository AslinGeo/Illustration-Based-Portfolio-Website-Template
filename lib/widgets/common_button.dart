import 'package:flutter_svg/svg.dart';
import 'package:illustration_based_portfolio/core/app_colors.dart';
import 'package:illustration_based_portfolio/widgets/text.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double height;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final Color borderColor;
  final double radius;
  final String? icon;

  const CommonButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height = 40,
    this.backgroundColor = AppColors.white,
    this.borderColor = AppColors.white,
    this.textColor = AppColors.white,
    this.fontSize = 15,
    this.radius = 24,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(color: borderColor, width: 3),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              TextWidget(text: text, size: fontSize, color: textColor),
              icon != null ? SvgPicture.asset(icon!) : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
