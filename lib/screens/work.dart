// import 'package:illustration_based_portfolio/core/app_colors.dart';
// import 'package:illustration_based_portfolio/core/responsive.dart';
// import 'package:illustration_based_portfolio/data/model/personal_data.dart';

// import 'package:illustration_based_portfolio/widgets/text.dart';

// import 'package:flutter/material.dart';
// import 'package:illustration_based_portfolio/widgets/web_link_preview.dart';

// class WorkScreen extends StatelessWidget {
//   const WorkScreen({super.key});
//   static const List<Map<String, String>> works = [
//     {"url": PersonalData.joggleCustomer},
//     {"url": PersonalData.jogglePatner},
//     {"url": PersonalData.mythings},
//     {"url": PersonalData.ramzTrading},
//     {"url": PersonalData.fitFresh},
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.black,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 40),
//         child: Column(
//           spacing: 40,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               spacing: 10,
//               children: [
//                 TextWidget(
//                   text: "My",
//                   size: responsiveFont(context, 48),
//                   weight: FontWeight.normal,
//                   color: AppColors.white,
//                 ),

//                 TextWidget(
//                   text: "Projects",
//                   size: responsiveFont(context, 48),
//                   weight: FontWeight.w800,
//                   color: AppColors.white,
//                 ),
//               ],
//             ),
//             // ProjectCard(isLeftAligned: true),
//             // ProjectCard(isLeftAligned: false),
//             // ProjectCard(isLeftAligned: true),
//             // ProjectCard(isLeftAligned: false),
//             Expanded(
//               child: ListView.builder(
//                 physics: NeverScrollableScrollPhysics(),
//                 itemCount: works.length,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: const EdgeInsets.only(bottom: 20),
//                     child: WebLinkPreview(
//                       url: works[index]["url"]!,
//                       index: index,
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

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
    return Container(
      color: AppColors.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Title
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(
                  text: "My",
                  size: responsiveFont(context, 48),
                  weight: FontWeight.normal,
                  color: AppColors.white,
                ),
                const SizedBox(width: 10),
                TextWidget(
                  text: "Projects",
                  size: responsiveFont(context, 48),
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
                height: 400,
                viewportFraction: 0.75,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
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
