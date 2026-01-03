import 'package:illustration_based_portfolio/core/app_colors.dart';
import 'package:illustration_based_portfolio/widgets/project_card.dart';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

Future<Map<String, dynamic>?> fetchLinkPreview(String url) async {
  final res = await http.get(Uri.parse('https://api.microlink.io/?url=$url'));

  if (res.statusCode == 200) {
    return jsonDecode(res.body)['data'];
  }
  return null;
}

class WebLinkPreview extends StatelessWidget {
  final String url;
  final int index;

  const WebLinkPreview({super.key, required this.url, required this.index});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchLinkPreview(url),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container(width: 260, height: 160, color: AppColors.white);
        }

        final data = snapshot.data!;

        return GestureDetector(
          onTap: () {
            launchUrl(Uri.parse(url));
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ProjectCard(
              projectImage: data["image"]["url"],
              projectTitle: data['title'] ?? "",
              projectDescription: data['description'] ?? "",
              isLeftAligned: index % 2 == 0,
              projectIndex: index,
              projectLink: url,
            ),
          ),
        );
      },
    );
  }
}
