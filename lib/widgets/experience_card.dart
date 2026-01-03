import 'package:illustration_based_portfolio/core/app_colors.dart';
import 'package:illustration_based_portfolio/core/responsive.dart';
import 'package:illustration_based_portfolio/widgets/text.dart';
import 'package:flutter/material.dart';

class ExperienceCard extends StatefulWidget {
  final String title;

  final String duration;

  final String imagePath;
  final List<String>? experiencePoints;
  const ExperienceCard({
    super.key,
    required this.title,
    required this.experiencePoints,
    required this.duration,
    required this.imagePath,
  });

  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.grab,
      onEnter: (event) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHovered = false;
        });
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: isHovered
              // ignore: deprecated_member_use
              ? AppColors.zinc300.withOpacity(0.5)
              : AppColors.black,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.zinc300, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 20,
                    children: [
                      Image.asset(widget.imagePath, height: 40),

                      TextWidget(
                        text: widget.title,
                        size: responsiveFont(context, 24),
                        color: AppColors.white,
                        weight: FontWeight.w600,
                      ),
                    ],
                  ),
                  TextWidget(
                    text: widget.duration,
                    size: responsiveFont(context, 16),
                    weight: FontWeight.w600,
                    color: AppColors.zinc300,
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: widget.experiencePoints!.map((point) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: "• ",
                          color: AppColors.zinc300,
                          size: responsiveFont(context, 16),
                          weight: FontWeight.normal,
                        ),
                        Expanded(
                          child: TextWidget(
                            text: point,
                            color: AppColors.zinc300,
                            size: responsiveFont(context, 16),
                            weight: FontWeight.normal,
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
