import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:illustration_based_portfolio/core/app_colors.dart';
import 'package:illustration_based_portfolio/core/responsive.dart';
import 'package:illustration_based_portfolio/widgets/text.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class ProjectCard extends StatelessWidget {
  final bool isLeftAligned;
  final String projectImage;
  final String projectTitle;
  final String projectDescription;
  final String projectLink;
  int projectIndex;
  ProjectCard({
    super.key,
    required this.isLeftAligned,
    required this.projectImage,
    required this.projectTitle,
    required this.projectDescription,
    required this.projectLink,
    required this.projectIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 40,
      children: [
        Image.network(projectImage, height: 200, width: 200),

        Expanded(
          child: Column(
            spacing: 30,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: "0${projectIndex + 1}",
                color: AppColors.white,
                size: responsiveFont(context, 48),
                weight: FontWeight.w800,
              ),
              TextWidget(
                text: projectTitle,
                color: AppColors.white,
                size: responsiveFont(context, 32),
                weight: FontWeight.bold,
              ),
              TextWidget(
                text: projectDescription,
                color: AppColors.zinc500,
                size: responsiveFont(context, 16),
                weight: FontWeight.normal,
              ),
              // ignore: deprecated_member_use
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    launchUrl(Uri.parse(projectLink));
                  },
                  child: SvgPicture.asset(
                    "asset/svg/arrow.svg",
                    // ignore: deprecated_member_use
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
