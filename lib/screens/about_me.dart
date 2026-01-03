import 'package:flutter/material.dart';
import 'package:illustration_based_portfolio/core/app_colors.dart';
import 'package:illustration_based_portfolio/core/responsive.dart';
import 'package:illustration_based_portfolio/widgets/text.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    return Container(
      color: AppColors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 80,
          vertical: isMobile ? 10 : 40,
        ),
        child: isMobile
            ? Column(
                spacing: 30,
                children: [
                  Image.asset("asset/images/about_me.png", height: 500),
                  aboutMe(isMobile),
                ],
              )
            : Row(
                spacing: 30,
                children: [
                  Image.asset("asset/images/about_me.png", height: 500),
                  Expanded(child: aboutMe(isMobile)),
                ],
              ),
      ),
    );
  }

  Widget aboutMe(bool isMobile) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            TextWidget(
              text: "A Little Bit",
              size: isMobile ? 24 : 48,
              weight: FontWeight.normal,
              color: AppColors.black,
            ),

            TextWidget(
              text: "About Me",
              size: isMobile ? 24 : 48,
              weight: FontWeight.w800,
              color: AppColors.black,
            ),
          ],
        ),

        Column(
          spacing: 10,
          children: [
            TextWidget(
              text:
                  "I’m Aslin Geo, a passionate Flutter Developer with 4.5+ years of experience in building high-performance mobile and web applications. I specialize in creating scalable, user-friendly solutions using Flutter, following clean architecture principles and modern state management techniques.",
              size: 16,
              weight: FontWeight.normal,
              color: AppColors.zinc500,
            ),
            TextWidget(
              text:
                  "Over the years, I’ve worked on multiple real-world projects including e-commerce platforms, class management systems, and feature-rich applications with deep linking, notifications, maps, and payment integrations. I enjoy turning complex problems into simple, elegant solutions while focusing on performance, maintainability, and great user experience.",
              size: 16,
              weight: FontWeight.normal,
              color: AppColors.zinc500,
            ),
            TextWidget(
              text:
                  "I’m continuously learning new technologies, contributing to my professional growth, and aiming to build products that create real value for users. My goal is to work on impactful projects and grow as a full-stack mobile developer in the global tech ecosystem.",
              size: 16,
              weight: FontWeight.normal,
              color: AppColors.zinc500,
            ),
          ],
        ),
      ],
    );
  }
}
