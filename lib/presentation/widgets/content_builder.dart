import 'package:cv_daniel/core/layout/adaptive.dart';
import 'package:cv_daniel/presentation/widgets/animated_text_slide_box_transition.dart';
import 'package:cv_daniel/presentation/widgets/empty.dart';
import 'package:cv_daniel/presentation/widgets/spaces.dart';
import 'package:cv_daniel/values/values.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ContentBuilder extends StatelessWidget {
  const ContentBuilder({
    super.key,
    required this.width,
    required this.number,
    required this.section,
    required this.body,
    required this.controller,
    this.title = '',
    this.numberStyle,
    this.sectionStyle,
    this.titleStyle,
    this.heading,
    this.footer,
  });

  final double width;
  final AnimationController controller;
  final String number;
  final String section;
  final String? title;
  final TextStyle? numberStyle;
  final TextStyle? sectionStyle;
  final TextStyle? titleStyle;
  final Widget? heading;
  final Widget body;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? defaultNumberStyle = textTheme.bodyLarge?.copyWith(
      fontSize: Sizes.TEXT_SIZE_10,
      color: AppColors.letterColor,
      fontWeight: FontWeight.w400,
      height: 2.0,
      letterSpacing: 2,
    );
    TextStyle? defaultSectionStyle = defaultNumberStyle?.copyWith(
      color: AppColors.grey600,
    );
    TextStyle? defaultTitleStyle = textTheme.titleMedium?.copyWith(
      color: AppColors.letterColor,
      fontSize: responsiveSize(
        context,
        Sizes.TEXT_SIZE_16,
        Sizes.TEXT_SIZE_20,
      ),
    );
    return SizedBox(
      width: width,
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          double screenWidth = sizingInformation.screenSize.width;

          if (screenWidth <= RefinedBreakpoints().tabletNormal) {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedTextSlideBoxTransition(
                        controller: controller,
                        text: number,
                        textStyle: numberStyle ?? defaultNumberStyle,
                      ),
                      SpaceW8(),
                      AnimatedTextSlideBoxTransition(
                        controller: controller,
                        text: section,
                        textStyle: sectionStyle ?? defaultSectionStyle,
                      ),
                    ],
                  ),
                  SpaceH16(),
                  heading ??
                      AnimatedTextSlideBoxTransition(
                        controller: controller,
                        text: title!,
                        textStyle: titleStyle ?? defaultTitleStyle,
                      ),
                  SpaceH30(),
                  body,
                  footer ?? Empty(),
                ],
              ),
            );
          } else {
            return Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedTextSlideBoxTransition(
                        controller: controller,
                        text: number,
                        textStyle: numberStyle ?? defaultNumberStyle,
                      ),
                      SpaceW16(),
                      Expanded(
                        child: AnimatedTextSlideBoxTransition(
                          controller: controller,
                          text: section,
                          textStyle: sectionStyle ?? defaultSectionStyle,
                        ),
                      ),
                    ],
                  ),
                ),
                SpaceW40(),
                SizedBox(
                  width: width * 0.75,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      heading ??
                          AnimatedTextSlideBoxTransition(
                            controller: controller,
                            text: title!,
                            textStyle: titleStyle ?? defaultTitleStyle,
                          ),
                      SpaceH20(),
                      body,
                      footer ?? Empty(),
                    ],
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
