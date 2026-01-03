import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:illustration_based_portfolio/core/app_colors.dart';
import 'package:illustration_based_portfolio/core/responsive.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? hint;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final int maxLines;
  final Function(String?)? validator;

  const AppTextField({
    super.key,
    required this.controller,
    required this.label,
    this.hint,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.maxLines = 1,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      textCapitalization: TextCapitalization.sentences,
      maxLines: maxLines,
      validator: (value) => validator != null ? validator!(value) : null,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        labelStyle: TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
          fontFamily: GoogleFonts.sora().fontFamily,
          fontSize: responsiveFont(context, 12),
        ),
        hintStyle: hint != null
            ? TextStyle(
                color: AppColors.zinc300,
                fontFamily: GoogleFonts.sora().fontFamily,
                fontSize: responsiveFont(context, 16),
              )
            : null,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.black, width: 2),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.black, width: 2),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.peach, width: 2),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.black, width: 2),
        ),
      ),
    );
  }
}
