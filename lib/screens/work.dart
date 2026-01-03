import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:illustration_based_portfolio/core/app_colors.dart';
import 'package:illustration_based_portfolio/core/responsive.dart';
import 'package:illustration_based_portfolio/data/model/personal_data.dart';
import 'package:illustration_based_portfolio/widgets/text.dart';
import 'package:illustration_based_portfolio/widgets/web_link_preview.dart';

class WorkScreen extends StatefulWidget {
  const WorkScreen({super.key});

  @override
  State<WorkScreen> createState() => _WorkScreenState();
}

class _WorkScreenState extends State<WorkScreen> {
  int _currentIndex = 0;

  static const List<Map<String, String>> works = [
    {"url": PersonalData.joggleCustomer},
    {"url": PersonalData.jogglePatner},
    {"url": PersonalData.mythings},
    {"url": PersonalData.ramzTrading},
    {"url": PersonalData.fitFresh},
  ];

  @override
  Widget build(BuildContext context) {
    final bool isMobile = !Responsive.isDesktop(context);
    return Container(
      color: AppColors.black,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 40 : 80,
          vertical: isMobile ? 30 : 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Title
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(
                  text: "My",
                  size: isMobile ? 24 : 48,
                  weight: FontWeight.normal,
                  color: AppColors.white,
                ),
                const SizedBox(width: 10),
                TextWidget(
                  text: "Projects",
                  size: isMobile ? 24 : 48,
                  weight: FontWeight.w800,
                  color: AppColors.white,
                ),
              ],
            ),

            const SizedBox(height: 50),

            /// Carousel
            CarouselSlider.builder(
              itemCount: works.length,
              itemBuilder: (context, index, realIndex) {
                return WebLinkPreview(url: works[index]["url"]!, index: index);
              },
              options: CarouselOptions(
                height: isMobile ? 500 : 400,

                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                autoPlay: true,
                scrollPhysics: const BouncingScrollPhysics(),
                onPageChanged: (index, reason) {
                  setState(() => _currentIndex = index);
                },
              ),
            ),

            const SizedBox(height: 25),

            /// Dots Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: works.asMap().entries.map((entry) {
                final bool isActive = _currentIndex == entry.key;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: isActive ? 18 : 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: isActive
                        ? AppColors.white
                        // ignore: deprecated_member_use
                        : AppColors.white.withOpacity(0.4),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
