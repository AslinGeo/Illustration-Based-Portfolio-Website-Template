import 'package:flutter/material.dart';
import 'package:illustration_based_portfolio/core/app_colors.dart';
import 'package:illustration_based_portfolio/core/email_service.dart';
import 'package:illustration_based_portfolio/core/responsive.dart';
import 'package:illustration_based_portfolio/data/model/personal_data.dart';
import 'package:illustration_based_portfolio/widgets/common_button.dart';
import 'package:illustration_based_portfolio/widgets/contact_widget.dart';
import 'package:illustration_based_portfolio/widgets/outline_text.dart';
import 'package:illustration_based_portfolio/widgets/text.dart';
import 'package:illustration_based_portfolio/widgets/text_field.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class ContactMe extends StatefulWidget {
  const ContactMe({super.key});

  @override
  State<ContactMe> createState() => _ContactMeState();
}

class _ContactMeState extends State<ContactMe> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController messageController = TextEditingController();

  final GlobalKey<FormState> contactFormKey = GlobalKey<FormState>();

  Future<void> launchLink(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: !Responsive.isDesktop(context) ? 20 : 80,
          vertical: !Responsive.isDesktop(context) ? 40 : 80,
        ),
        child: !Responsive.isDesktop(context)
            ? Column(
                spacing: 40,
                children: [
                  formFields(!Responsive.isDesktop(context)),
                  content(!Responsive.isDesktop(context)),
                ],
              )
            : Row(
                spacing: 50,
                children: [
                  Flexible(
                    flex: 1,
                    child: formFields(!Responsive.isDesktop(context)),
                  ),
                  Flexible(
                    flex: 1,
                    child: content(!Responsive.isDesktop(context)),
                  ),
                ],
              ),
      ),
    );
  }

  Widget formFields(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Form(
          key: contactFormKey,
          child: Column(
            spacing: 10,
            children: [
              AppTextField(
                controller: nameController,
                label: "Your Name",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                keyboardType: TextInputType.name,
              ),
              AppTextField(
                controller: emailController,
                label: "Email Address",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  // Simple email validation
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
              ),
              AppTextField(
                controller: messageController,
                label: "How can I help?*",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your message';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                maxLines: 7,
                textInputAction: TextInputAction.done,
              ),
            ],
          ),
        ),
        Visibility(
          visible: isMobile,
          child: CommonButton(
            radius: 4,
            width: isMobile ? 150 : 170,
            height: 60,
            text: "Get In Touch",
            onPressed: () {
              if (contactFormKey.currentState!.validate()) {
                sendEmailJS(
                  name: nameController.text,
                  email: emailController.text,
                  message: messageController.text,
                );
                setState(() {
                  nameController.clear();
                  emailController.clear();
                  messageController.clear();
                });
              }
            },
            backgroundColor: AppColors.black,
          ),
        ),
        Row(
          spacing: isMobile ? 10 : 20,
          children: [
            Visibility(
              visible: !isMobile,
              child: CommonButton(
                radius: 4,
                width: isMobile ? 150 : 170,
                height: 60,
                text: "Get In Touch",
                onPressed: () {
                  if (contactFormKey.currentState!.validate()) {
                    sendEmailJS(
                      name: nameController.text,
                      email: emailController.text,
                      message: messageController.text,
                    );
                    setState(() {
                      nameController.clear();
                      emailController.clear();
                      messageController.clear();
                    });
                  }
                },
                backgroundColor: AppColors.black,
              ),
            ),
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

  Widget content(bool isMobile) {
    return Column(
      children: [
        Row(
          spacing: 20,
          children: [
            TextWidget(
              text: "Let’s",
              size: isMobile ? 24 : 48,
              weight: FontWeight.w800,
            ),
            CustomPaint(
              size: Size(isMobile ? 40 : 100, isMobile ? 30 : 60),
              painter: OutlineTextPainter('talk', isMobile ? 24 : 48),
            ),
            TextWidget(
              text: "for",
              size: isMobile ? 24 : 48,
              weight: FontWeight.w800,
            ),
          ],
        ),

        Row(
          spacing: 20,
          children: [
            TextWidget(
              text: "Something special",
              size: isMobile ? 24 : 48,
              weight: FontWeight.w800,
            ),
          ],
        ),

        SizedBox(height: 40),
        TextWidget(
          text:
              "I seek to push the limits of creativity to create high-engaging, user-friendly, and memorable interactive experiences.",
          size: 16,
          weight: FontWeight.normal,
        ),
      ],
    );
  }
}
