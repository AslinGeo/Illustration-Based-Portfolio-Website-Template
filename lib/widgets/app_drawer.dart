import 'package:flutter/material.dart';
import 'package:illustration_based_portfolio/core/app_colors.dart';
import 'package:illustration_based_portfolio/widgets/common_button.dart';
import 'package:illustration_based_portfolio/widgets/text.dart';
// ignore: deprecated_member_use, avoid_web_libraries_in_flutter
import 'dart:html' as html;

class AppDrawer extends StatelessWidget {
  final int activeIndex;
  final Function(int) onTap;

  const AppDrawer({super.key, required this.activeIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.white,
      child: Column(
        children: [
          const SizedBox(height: 60),

          _drawerItem("Home", 0),
          _drawerItem("Skills", 1),
          _drawerItem("Experience", 2),
          _drawerItem("About Me", 3),
          _drawerItem("Projects", 4),
          _drawerItem("Contact Me", 5),

          const Spacer(),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
            child: CommonButton(
              radius: 4,
              width: double.infinity,
              height: 50,
              text: "Resume",
              onPressed: () {
                html.AnchorElement(href: 'AslinGeo_resume.pdf').click();
              },
              backgroundColor: AppColors.black,
              icon: "asset/svg/download.svg",
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawerItem(String text, int index) {
    final bool isActive = activeIndex == index;

    return ListTile(
      title: TextWidget(
        text: text,
        color: isActive ? AppColors.peach : AppColors.black,
      ),
      onTap: () => onTap(index),
    );
  }
}
