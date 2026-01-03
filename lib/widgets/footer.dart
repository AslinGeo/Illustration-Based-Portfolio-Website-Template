import 'package:flutter/material.dart';
import 'package:illustration_based_portfolio/core/app_colors.dart';
import 'package:illustration_based_portfolio/core/responsive.dart';
import 'package:illustration_based_portfolio/widgets/text.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    return Container(
      color: AppColors.black,

      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 80,
          vertical: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextWidget(
              text: isMobile
                  ? "© 2026 Aslin Geo.\n All rights reserved."
                  : "© 2026 Aslin Geo. All rights reserved.",
              color: AppColors.white,
              size: 16,
              weight: FontWeight.w600,
            ),
            TextWidget(
              text: "Made in Flutter ❤️",
              color: AppColors.white,
              size: 16,
              weight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
