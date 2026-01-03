import 'package:flutter/material.dart';
import 'package:illustration_based_portfolio/core/app_colors.dart';
import 'package:illustration_based_portfolio/core/responsive.dart';
import 'package:illustration_based_portfolio/data/model/personal_data.dart';
import 'package:illustration_based_portfolio/widgets/contact_widget.dart';
import 'package:illustration_based_portfolio/widgets/outline_text.dart';
import 'package:illustration_based_portfolio/widgets/text.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart' show launchUrl, LaunchMode;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = !Responsive.isDesktop(context);

    return Container(
      color: AppColors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 80),
        child: isMobile
            ? Stack(
                children: [
                  Lottie.asset('asset/lottie/Birds.json'),
                  Column(
                    children: [
                      Image.asset(
                        'asset/images/Banner.png',
                        height: 350,
                        width: 350,
                      ),
                      HomeInfo(isMobile: isMobile),
                    ],
                  ),
                ],
              )
            : Stack(
                fit: StackFit.loose,
                children: [
                  Lottie.asset('asset/lottie/Birds.json'),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: HomeInfo(isMobile: isMobile),
                  ),
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

class HomeInfo extends StatelessWidget {
  final bool isMobile;
  const HomeInfo({super.key, required this.isMobile});
  Future<void> launchLink(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 30,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,

      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 20,
              children: [
                TextWidget(
                  text: "Hello I’am",
                  size: isMobile ? 24 : 48,
                  weight: FontWeight.normal,
                ),
                TextWidget(
                  text: "Aslin Geo.",
                  size: isMobile ? 24 : 48,
                  weight: FontWeight.w800,
                ),
              ],
            ),
            Row(
              spacing: 20,
              children: [
                TextWidget(
                  text: "Flutter",
                  size: isMobile ? 24 : 48,
                  weight: FontWeight.w800,
                ),
                CustomPaint(
                  size: Size(isMobile ? 100 : 300, isMobile ? 30 : 60),
                  painter: OutlineTextPainter('Developer', isMobile ? 24 : 48),
                ),
              ],
            ),
            Row(
              spacing: 20,
              children: [
                TextWidget(
                  text: "Based In",
                  size: isMobile ? 24 : 48,
                  weight: FontWeight.normal,
                ),
                TextWidget(
                  text: "India.",
                  size: isMobile ? 24 : 48,
                  weight: FontWeight.w800,
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          width: 700,
          child: TextWidget(
            text:
                "I’m Aslin Geo, a passionate Flutter Developer with 4.5+ years of experience in building high-performance mobile and web applications. I specialize in creating scalable, user-friendly solutions using Flutter, following clean architecture principles and modern state management techniques.",
            size: 16,
            weight: FontWeight.normal,
          ),
        ),

        Row(
          spacing: 20,
          children: [
            ContactWidget(
              height: isMobile ? 48 : 56,
              width: isMobile ? 48 : 56,
              svgPath: "asset/svg/gmail.svg",
              onTap: () => launchLink(
                "mailto:aslingeos@gmail.com?subject=Portfolio Contact",
              ),
            ),
            ContactWidget(
              height: isMobile ? 48 : 56,
              width: isMobile ? 48 : 56,
              svgPath: "asset/svg/linkedin.svg",
              onTap: () => launchLink(PersonalData.linkedIn),
            ),
            ContactWidget(
              height: isMobile ? 48 : 56,
              width: isMobile ? 48 : 56,
              svgPath: "asset/svg/github.svg",
              onTap: () => launchLink(PersonalData.github),
            ),
            ContactWidget(
              height: isMobile ? 48 : 56,
              width: isMobile ? 48 : 56,
              svgPath: "asset/svg/whatsapp.svg",
              onTap: () => launchLink("https://wa.me/918220398554"),
            ),
            ContactWidget(
              height: isMobile ? 48 : 56,
              width: isMobile ? 48 : 56,
              svgPath: "asset/svg/call.svg",
              onTap: () => launchLink("tel:+918220398554"),
            ),
          ],
        ),
      ],
    );
  }
}
