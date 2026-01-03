import 'package:flutter/material.dart';
import 'package:illustration_based_portfolio/core/app_colors.dart';
import 'package:illustration_based_portfolio/widgets/home_info.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80),
        child: Stack(
          fit: StackFit.loose,
          children: [
            Align(alignment: Alignment.bottomLeft, child: HomeInfo()),
            Align(
              alignment: Alignment.centerRight,
              child: Image.asset('asset/images/Banner.png', height: 500),
            ),
          ],
        ),
      ),
    );
  }
}
