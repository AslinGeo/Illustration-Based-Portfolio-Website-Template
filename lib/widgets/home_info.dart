import 'package:illustration_based_portfolio/core/responsive.dart';
import 'package:illustration_based_portfolio/data/model/personal_data.dart';
import 'package:illustration_based_portfolio/widgets/contact_widget.dart';
import 'package:illustration_based_portfolio/widgets/outline_text.dart';
import 'package:illustration_based_portfolio/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeInfo extends StatelessWidget {
  const HomeInfo({super.key});
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
                  size: responsiveFont(context, 48),
                  weight: FontWeight.normal,
                ),
                TextWidget(
                  text: "Aslin Geo.",
                  size: responsiveFont(context, 48),
                  weight: FontWeight.w800,
                ),
              ],
            ),
            Row(
              spacing: 20,
              children: [
                TextWidget(
                  text: "Flutter",
                  size: responsiveFont(context, 48),
                  weight: FontWeight.w800,
                ),
                CustomPaint(
                  size: const Size(300, 60),
                  painter: OutlineTextPainter('Developer'),
                ),
              ],
            ),
            Row(
              spacing: 20,
              children: [
                TextWidget(
                  text: "Based In",
                  size: responsiveFont(context, 48),
                  weight: FontWeight.normal,
                ),
                TextWidget(text: "India.", size: 48, weight: FontWeight.w800),
              ],
            ),
          ],
        ),
        SizedBox(
          width: 700,
          child: TextWidget(
            text:
                "I’m Aslin Geo, a passionate Flutter Developer with 4.5+ years of experience in building high-performance mobile and web applications. I specialize in creating scalable, user-friendly solutions using Flutter, following clean architecture principles and modern state management techniques.",
            size: responsiveFont(context, 16),
            weight: FontWeight.normal,
          ),
        ),

        Row(
          spacing: 20,
          children: [
            ContactWidget(
              svgPath: "asset/svg/gmail.svg",
              onTap: () => launchLink(
                "mailto:aslingeos@gmail.com?subject=Portfolio Contact",
              ),
            ),
            ContactWidget(
              svgPath: "asset/svg/linkedin.svg",
              onTap: () => launchLink(PersonalData.linkedIn),
            ),
            ContactWidget(
              svgPath: "asset/svg/github.svg",
              onTap: () => launchLink(PersonalData.github),
            ),
            ContactWidget(
              svgPath: "asset/svg/whatsapp.svg",
              onTap: () => launchLink("https://wa.me/918220398554"),
            ),
            ContactWidget(
              svgPath: "asset/svg/call.svg",
              onTap: () => launchLink("tel:+918220398554"),
            ),
          ],
        ),
      ],
    );
  }
}
