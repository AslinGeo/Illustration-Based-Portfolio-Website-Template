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
class ContactMe extends StatelessWidget {
  ContactMe({super.key});
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
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
        child: LayoutBuilder(
          builder: (context, constrain) {
            return Row(
              spacing: 50,
              children: [
                Flexible(
                  flex: 1,
                  child: Column(
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
                                if (!RegExp(
                                  r'^[^@]+@[^@]+\.[^@]+',
                                ).hasMatch(value)) {
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
                      Row(
                        spacing: 20,
                        children: [
                          CommonButton(
                            radius: 4,
                            width: 170,
                            height: 60,
                            text: "Get In Touch",
                            onPressed: () {
                              if (contactFormKey.currentState!.validate()) {
                                sendEmailJS(
                                  name: nameController.text,
                                  email: emailController.text,
                                  message: messageController.text,
                                );
                              }
                            },
                            backgroundColor: AppColors.black,
                          ),
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
                            onTap: () =>
                                launchLink("https://wa.me/918220398554"),
                          ),
                          ContactWidget(
                            svgPath: "asset/svg/call.svg",
                            onTap: () => launchLink("tel:+918220398554"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Column(
                    children: [
                      Row(
                        spacing: 20,
                        children: [
                          TextWidget(
                            text: "Let’s",
                            size: responsiveFont(context, 48),
                            weight: FontWeight.w800,
                          ),
                          CustomPaint(
                            size: const Size(100, 60),
                            painter: OutlineTextPainter('talk'),
                          ),
                          TextWidget(
                            text: "for",
                            size: responsiveFont(context, 48),
                            weight: FontWeight.w800,
                          ),
                        ],
                      ),

                      Row(
                        spacing: 20,
                        children: [
                          TextWidget(
                            text: "Something special",
                            size: responsiveFont(context, 48),
                            weight: FontWeight.w800,
                          ),
                        ],
                      ),

                      SizedBox(height: 40),
                      TextWidget(
                        text:
                            "I seek to push the limits of creativity to create high-engaging, user-friendly, and memorable interactive experiences.",
                        size: responsiveFont(context, 16),
                        weight: FontWeight.normal,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
