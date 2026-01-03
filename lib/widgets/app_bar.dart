

import 'package:flutter/material.dart';
import 'package:illustration_based_portfolio/core/app_colors.dart';
import 'package:illustration_based_portfolio/core/responsive.dart';
import 'package:illustration_based_portfolio/widgets/common_button.dart';
import 'package:illustration_based_portfolio/widgets/text.dart';
// ignore: deprecated_member_use, avoid_web_libraries_in_flutter
import 'dart:html' as html;

class AppBarWidget extends StatelessWidget {
  final int activeIndex;
  final Function(int) onTap;
  final VoidCallback onMenuTap;

  const AppBarWidget({
    super.key,
    required this.activeIndex,
    required this.onTap,
    required this.onMenuTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMobile = !Responsive.isDesktop(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 0 : 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (isMobile) TextWidget(text: "Aslin Geo"),

          /// 🔹 Mobile: Hamburger
          if (isMobile)
            IconButton(icon: const Icon(Icons.menu), onPressed: onMenuTap),

          /// 🔹 Desktop: Nav items
          if (!isMobile)
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

          /// Resume button (optional hide on mobile)
          if (!isMobile)
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
      child: TextWidget(
        text: text,
        color: isActive ? AppColors.peach : AppColors.black,
      ),
    );
  }
}
