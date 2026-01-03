import 'package:illustration_based_portfolio/core/app_colors.dart';
import 'package:illustration_based_portfolio/widgets/common_button.dart';
import 'package:illustration_based_portfolio/widgets/text.dart';
import 'package:flutter/material.dart';
// ignore: deprecated_member_use, avoid_web_libraries_in_flutter
import 'dart:html' as html;

class AppBarWidget extends StatelessWidget {
  final int activeIndex;
  final Function(int) onTap;
  const AppBarWidget({
    super.key,
    required this.activeIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 20,
            children: [
              _navItem("Home", 0),
              _navItem("Skills", 1),
              _navItem("Experience", 2),
              _navItem("About Me", 3),
              _navItem("Projects", 4),
              _navItem("Contact Me", 5),
            ],
          ),

          CommonButton(
            radius: 4,
            width: 140,
            height: 50,
            text: "Resume",
            onPressed: () {
              html.AnchorElement(href: 'AslinGeo_resume.pdf').click();
            },
            backgroundColor: AppColors.black,
            icon: "asset/svg/download.svg",
          ),
        ],
      ),
    );
  }

  Widget _navItem(String text, int index) {
    final bool isActive = activeIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 200),
        style: TextStyle(color: isActive ? AppColors.peach : AppColors.black),
        child: TextWidget(
          text: text,
          color: isActive ? AppColors.peach : AppColors.black,
        ),
      ),
    );
  }
}
