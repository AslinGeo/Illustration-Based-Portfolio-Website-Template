import 'package:flutter/material.dart';
import 'package:illustration_based_portfolio/core/app_colors.dart';
import 'package:illustration_based_portfolio/core/responsive.dart';
import 'package:illustration_based_portfolio/widgets/experience_card.dart';
import 'package:illustration_based_portfolio/widgets/text.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  static const List<Map<String, dynamic>> experiences = [
    {
      "title": "Specialist",
      "company": "Acsia Technologies",
      "duration": "May 2025 - Present",
      "logoPath": "asset/company/acsia-logo.png",
      "experience": [
        "Architected and delivered a real-time EV Charging Station Monitoring System using Flutter Web, supporting live operational visibility across charging infrastructure. ",
        "Strengthened delivery reliability by supporting CI/CD workflows, enabling faster and safer production deployments.",
        "Improved application responsiveness and load performance by optimizing widget rebuilds, state flows, and API data handling.",
      ],
    },
    {
      "title": "Product Engineer",
      "company": "Inference Intelligence LLP",
      "duration": "Jul 2024 – Apr 2025",
      "logoPath": "asset/company/inference-logo.png",
      "experience": [
        "Played a key role in Joggle, a logistics and e-commerce platform, delivering accurate real-time tracking through address-to-coordinate conversion.",
        "Implemented deep linking and Firebase notifications, driving higher user engagement and real-time order updates.",
        "Integrated third-party APIs using Strapi CMS to dynamically manage and display promotional banners, offers, and editorial articles, enabling content updates without app releases.",
      ],
    },
    {
      "title": "Developer",
      "company": "Agile Cyber Solutions",
      "duration": "Feb 2022 – Jun 2024",
      "logoPath": "asset/company/agile-logo.png",
      "experience": [
        "Designed and implemented a robust notification ecosystem covering friend requests, data sharing, backups, and user activity events, integrating device identification and OneSignal to ensure reliable, scalable, and secure push notification delivery.",
        "Built an offline-first architecture using Hive, achieving a 95% improvement in offline usability and data availability, and optimized backend communication and synchronization logic, resulting in a 30% improvement in online performance through Neo4j enhancements.",
        "Designed and implemented an AI-powered auto-suggestion system within the Inbox module to intelligently categorize and store incoming documents, reducing manual sorting effort by 60% and significantly improving user productivity.",
      ],
    },
    {
      "title": "Developer Trainee",
      "company": "Agile Cyber Solutions",
      "duration": "Aug 2021 - Jan 2022",
      "logoPath": "asset/company/agile-logo.png",
      "experience": [
        "Developed Note Keeper, a production-ready Flutter application with secure Google, Facebook, and Apple authentication.",
        "mplemented real-time data storage with offline caching, delivering seamless cross-device synchronization.",
        "Followed best practices for state management, code organization, and version control during early-stage development.",
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final bool isMobile = !Responsive.isDesktop(context);
    return Container(
      color: AppColors.black,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 80,
          vertical: isMobile ? 30 : 40,
        ),
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
                  size: isMobile ? 24 : 48,
                  weight: FontWeight.normal,
                  color: AppColors.white,
                ),

                TextWidget(
                  text: "Experience",
                  size: isMobile ? 24 : 48,
                  weight: FontWeight.w800,
                  color: AppColors.white,
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final experience = experiences[index];

                return Column(
                  children: [
                    ExperienceCard(
                      title: experience['title']!,
                      experiencePoints: [...experience['experience']!],
                      duration: experience['duration']!,
                      imagePath: experience['logoPath']!,
                    ),
                    SizedBox(height: 20),
                  ],
                );
              },
              itemCount: experiences.length,
            ),
          ],
        ),
      ),
    );
  }
}
