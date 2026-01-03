import 'package:flutter/material.dart';
import 'package:illustration_based_portfolio/core/app_colors.dart';
import 'package:illustration_based_portfolio/screens/about_me.dart';
import 'package:illustration_based_portfolio/screens/contact.dart';
import 'package:illustration_based_portfolio/screens/experience.dart';
import 'package:illustration_based_portfolio/screens/home.dart';
import 'package:illustration_based_portfolio/screens/skills.dart';
import 'package:illustration_based_portfolio/screens/work.dart';
import 'package:illustration_based_portfolio/widgets/app_bar.dart';
import 'package:illustration_based_portfolio/widgets/footer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ScrollController _scrollController = ScrollController();

  int _activeIndex = 0;

  final List<GlobalKey> sectionKeys = [
    GlobalKey(), // Home
    GlobalKey(), // Skills
    GlobalKey(), // Experience
    GlobalKey(), // About
    GlobalKey(), // Work
    GlobalKey(), // Contact
  ];
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    for (int i = 0; i < sectionKeys.length; i++) {
      final context = sectionKeys[i].currentContext;
      if (context != null) {
        final box = context.findRenderObject() as RenderBox;
        final position = box.localToGlobal(Offset.zero).dy;

        if (position <= 200 && position >= -200) {
          setState(() => _activeIndex = i);
          break;
        }
      }
    }
  }

  void _scrollToSection(int index) {
    final context = sectionKeys[index].currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(180),
        child: AppBarWidget(activeIndex: _activeIndex, onTap: _scrollToSection),
      ),

      // body: SingleChildScrollView(
      //   controller: _scrollController,
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.stretch,
      //     children: [
      //       Container(key: sectionKeys[0], child: HomeScreen()),
      //       Container(key: sectionKeys[1], child: Skills()),
      //       Container(key: sectionKeys[2], child: ExperienceScreen()),
      //       Container(key: sectionKeys[3], child: AboutMe()),
      //       Container(key: sectionKeys[4], child: WorkScreen()),
      //       Container(key: sectionKeys[5], child: ContactMe()),
      //       const Footer(),
      //     ],
      //   ),
      // ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            SizedBox(height: 50),
            Container(key: sectionKeys[0], child: HomeScreen()),
            Container(key: sectionKeys[1], child: Skills()),
            Container(key: sectionKeys[2], child: ExperienceScreen()),
            Container(key: sectionKeys[3], child: AboutMe()),
            Container(key: sectionKeys[4], child: WorkScreen()),
            Container(key: sectionKeys[5], child: ContactMe()),
            Footer(),
          ],
        ),
      ),
    );
  }
}
