import 'package:illustration_based_portfolio/core/app_colors.dart';
import 'package:illustration_based_portfolio/core/responsive.dart';
import 'package:illustration_based_portfolio/widgets/contact_widget.dart';
import 'package:illustration_based_portfolio/widgets/text.dart';
import 'package:flutter/material.dart';

class Skills extends StatelessWidget {
  const Skills({super.key});
  static List<Map<String, dynamic>> skills = [
    {"skill": "Flutter", "logo": "asset/skills/flutter.svg"},
    {"skill": "Dart", "logo": "asset/skills/dart.svg"},
    {"skill": "Firebase", "logo": "asset/skills/firebase.svg"},
    {"skill": "JavaScript", "logo": "asset/skills/javascript.svg"},
    {"skill": "Android", "logo": "asset/skills/android.svg"},
    {"skill": "iOS", "logo": "asset/skills/ios.svg"},
    {"skill": "Web", "logo": "asset/skills/web.svg"},

    {"skill": "Git", "logo": "asset/skills/git.svg"},
    {"skill": "GitHub", "logo": "asset/svg/github.svg"},
    {"skill": "Bloc", "logo": "asset/skills/dummy.svg"},
    {"skill": "Provider", "logo": "asset/skills/dummy.svg"},
    {"skill": "Getx", "logo": "asset/skills/dummy.svg"},
    {"skill": "Rest Apis", "logo": "asset/skills/rest-api.svg"},
    {"skill": "Hive", "logo": "asset/skills/hive.svg"},

    {"skill": "Azure Boards", "logo": "asset/skills/azure.svg"},
    {"skill": "Jira", "logo": "asset/skills/jira.svg"},
    {"skill": "Post Man", "logo": "asset/skills/postman.svg"},

    {"skill": "Figma", "logo": "asset/skills/figma.svg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 40),
        child: Column(
          spacing: 40,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                TextWidget(
                  text: "My",
                  size: responsiveFont(context, 48),
                  weight: FontWeight.normal,
                ),

                TextWidget(
                  text: "Skills",
                  size: responsiveFont(context, 48),
                  weight: FontWeight.w800,
                ),
              ],
            ),
            GridView.builder(
              itemCount: skills.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
                mainAxisSpacing: 30,
                crossAxisSpacing: 30,
                childAspectRatio: 1.5,
              ),
              itemBuilder: (context, index) {
                return ContactWidget(
                  height: 186,
                  width: 186,
                  svgPath: skills[index]['logo'],
                  title: skills[index]["skill"],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
