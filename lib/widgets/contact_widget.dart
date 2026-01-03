import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:illustration_based_portfolio/core/app_colors.dart';
import 'package:illustration_based_portfolio/widgets/text.dart';

class ContactWidget extends StatefulWidget {
  final String svgPath;
  final double width;
  final double height;
  final String? title;
  final Function()? onTap;
  const ContactWidget({
    super.key,
    required this.svgPath,
    this.width = 56,
    this.height = 56,
    this.onTap,
    this.title,
  });

  @override
  State<ContactWidget> createState() => _ContactWidgetState();
}

class _ContactWidgetState extends State<ContactWidget> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHovered = false;
        });
      },

      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
            color: isHovered ? AppColors.black : AppColors.white,
            border: Border.all(color: AppColors.black, width: 4),
            borderRadius: BorderRadius.circular(4),
          ),
          child: widget.title == null
              ? Center(
                  child: SvgPicture.asset(
                    widget.svgPath,
                    width: 20,
                    height: 20,
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 10,
                  children: [
                    SvgPicture.asset(
                      widget.svgPath,
                      width: 20,
                      height: 20,
                      // ignore: deprecated_member_use
                      color: isHovered ? AppColors.white : AppColors.black,
                    ),

                    TextWidget(
                      text: widget.title!,
                      size: 20,
                      weight: FontWeight.bold,
                      color: isHovered ? AppColors.white : AppColors.black,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
