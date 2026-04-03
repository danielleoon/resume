import 'package:cv_daniel/core/layout/adaptive.dart';
import 'package:cv_daniel/core/utils/functions.dart';
import 'package:cv_daniel/presentation/widgets/animated_bubble_button.dart';
import 'package:cv_daniel/presentation/widgets/animated_positioned_text.dart';
import 'package:cv_daniel/presentation/widgets/animated_positioned_widget.dart';
import 'package:cv_daniel/presentation/widgets/animated_text_slide_box_transition.dart';
import 'package:cv_daniel/presentation/widgets/empty.dart';
import 'package:cv_daniel/presentation/widgets/project_item.dart';
import 'package:cv_daniel/presentation/widgets/spaces.dart';
import 'package:cv_daniel/values/strings.dart';
import 'package:cv_daniel/values/values.dart';
import 'package:flutter/material.dart';

List<String> titles = [
  StringConst.PLATFORM,
  StringConst.CATEGORY,
  StringConst.AUTHOR,
  StringConst.DESIGNER,
  StringConst.TECHNOLOGY_USED,
];

class Aboutproject extends StatefulWidget {
  const Aboutproject({
    super.key,
    required this.controller,
    required this.projectDataController,
    required this.projectData,
    required this.width,
  });

  final AnimationController controller;
  final AnimationController projectDataController;
  final ProjectItemData projectData;
  final double width;

  @override
  _AboutprojectState createState() => _AboutprojectState();
}

class _AboutprojectState extends State<Aboutproject> {
  @override
  void initState() {
    super.initState();

    widget.controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.projectDataController.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool hasWebLink = widget.projectData.webUrl.trim().isNotEmpty;
    final bool hasSourceLink = widget.projectData.gitHubUrl.trim().isNotEmpty;
    final bool hasStoreLink = widget.projectData.playStoreUrl.trim().isNotEmpty;
    final bool hasAppStoreLink =
        widget.projectData.appStoreUrl.trim().isNotEmpty;
    double targetWidth = responsiveSize(context, 118, 150, md: 150);
    double initialWidth = responsiveSize(context, 36, 50, md: 50);
    double storeButtonWidth = responsiveSize(context, 190, 225, md: 210);
    double storeButtonHeight = 64;
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? bodyTextStyle = textTheme.bodyLarge?.copyWith(
      fontSize: Sizes.TEXT_SIZE_18,
      color: AppColors.grey750,
      fontWeight: FontWeight.w400,
      height: 2.0,
    );
    double projectDataWidth = responsiveSize(
      context,
      widget.width,
      widget.width * 0.55,
      md: widget.width * 0.75,
    );
    double projectDataSpacing =
        responsiveSize(context, widget.width * 0.1, 48, md: 36);
    double widthOfProjectItem = (projectDataWidth - (projectDataSpacing)) / 2;
    BorderRadiusGeometry borderRadius = const BorderRadius.all(
      Radius.circular(100.0),
    );
    TextStyle? buttonStyle = textTheme.bodyLarge?.copyWith(
      color: AppColors.black,
      fontSize: responsiveSize(
        context,
        Sizes.TEXT_SIZE_14,
        Sizes.TEXT_SIZE_16,
        sm: Sizes.TEXT_SIZE_15,
      ),
      fontWeight: FontWeight.w500,
    );
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedTextSlideBoxTransition(
            controller: widget.controller,
            text: StringConst.ABOUT_PROJECT,
            coverColor: AppColors.white,
            textStyle: textTheme.headlineMedium?.copyWith(
              fontSize: Sizes.TEXT_SIZE_48,
            ),
          ),
          SpaceH40(),
          AnimatedPositionedText(
            controller: CurvedAnimation(
              parent: widget.controller,
              curve: Animations.textSlideInCurve,
            ),
            width: widget.width * 0.7,
            maxLines: 10,
            text: widget.projectData.portfolioDescription,
            textStyle: bodyTextStyle,
          ),
          // SpaceH12(),
          SizedBox(
            width: projectDataWidth,
            child: Wrap(
              spacing: projectDataSpacing,
              runSpacing: responsiveSize(context, 30, 40),
              children: [
                ProjectData(
                  controller: widget.projectDataController,
                  width: widthOfProjectItem,
                  title: StringConst.PLATFORM,
                  subtitle: widget.projectData.platform,
                ),
                ProjectData(
                  controller: widget.projectDataController,
                  width: widthOfProjectItem,
                  title: StringConst.CATEGORY,
                  subtitle: widget.projectData.category,
                ),
                ProjectData(
                  controller: widget.projectDataController,
                  width: widthOfProjectItem,
                  title: StringConst.AUTHOR,
                  subtitle: StringConst.DEV_NAME,
                ),
              ],
            ),
          ),
          widget.projectData.designer != null ? SpaceH30() : Empty(),
          widget.projectData.designer != null
              ? ProjectData(
                  controller: widget.projectDataController,
                  title: StringConst.DESIGNER,
                  subtitle: widget.projectData.designer!,
                )
              : Empty(),
          widget.projectData.technologyUsed != null ? SpaceH30() : Empty(),
          widget.projectData.technologyUsed != null
              ? ProjectData(
                  controller: widget.projectDataController,
                  title: StringConst.TECHNOLOGY_USED,
                  subtitle: widget.projectData.technologyUsed!,
                )
              : Empty(),
          SpaceH30(),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              hasWebLink
                  ? AnimatedPositionedWidget(
                      controller: CurvedAnimation(
                        parent: widget.projectDataController,
                        curve: Animations.textSlideInCurve,
                      ),
                      width: targetWidth,
                      height: initialWidth,
                      child: AnimatedBubbleButton(
                        title: "Ir a sitio web",
                        color: AppColors.grey100,
                        imageColor: AppColors.black,
                        startBorderRadius: borderRadius,
                        startWidth: initialWidth,
                        height: initialWidth,
                        targetWidth: targetWidth,
                        titleStyle: buttonStyle,
                        onTap: () {
                          Functions.launchUrl(widget.projectData.webUrl);
                        },
                        startOffset: const Offset(0, 0),
                        targetOffset: const Offset(0.1, 0),
                      ),
                    )
                  : Empty(),
              hasSourceLink
                  ? AnimatedPositionedWidget(
                      controller: CurvedAnimation(
                        parent: widget.projectDataController,
                        curve: Animations.textSlideInCurve,
                      ),
                      width: targetWidth,
                      height: initialWidth,
                      child: AnimatedBubbleButton(
                        title: StringConst.SOURCE_CODE,
                        color: AppColors.grey100,
                        imageColor: AppColors.black,
                        startBorderRadius: borderRadius,
                        startWidth: initialWidth,
                        height: initialWidth,
                        targetWidth: targetWidth,
                        titleStyle: buttonStyle,
                        startOffset: const Offset(0, 0),
                        targetOffset: const Offset(0.1, 0),
                        onTap: () {
                          Functions.launchUrl(widget.projectData.gitHubUrl);
                        },
                      ),
                    )
                  : Empty(),
            ],
          ),
          hasWebLink || hasSourceLink || hasStoreLink || hasAppStoreLink
              ? SpaceH30()
              : Empty(),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              hasStoreLink
                  ? AnimatedPositionedWidget(
                      controller: CurvedAnimation(
                        parent: widget.projectDataController,
                        curve: Animations.textSlideInCurve,
                      ),
                      width: storeButtonWidth,
                      height: storeButtonHeight,
                      child: _StoreBadgeButton(
                        title: "Google Play",
                        subtitle: "GET IT ON",
                        icon: Icons.android_rounded,
                        onTap: () {
                          Functions.launchUrl(widget.projectData.playStoreUrl);
                        },
                      ),
                    )
                  : Empty(),
              hasAppStoreLink
                  ? AnimatedPositionedWidget(
                      controller: CurvedAnimation(
                        parent: widget.projectDataController,
                        curve: Animations.textSlideInCurve,
                      ),
                      width: storeButtonWidth,
                      height: storeButtonHeight,
                      child: _StoreBadgeButton(
                        title: "App Store",
                        subtitle: "Download on the",
                        icon: Icons.phone_iphone_rounded,
                        onTap: () {
                          Functions.launchUrl(widget.projectData.appStoreUrl);
                        },
                      ),
                    )
                  : Empty(),
            ],
          ),
        ],
      ),
    );
  }
}

class _StoreBadgeButton extends StatelessWidget {
  const _StoreBadgeButton({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: Ink(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: AppColors.grey300),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 26,
                color: AppColors.black,
              ),
              SpaceW12(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.bodyLarge?.copyWith(
                        color: AppColors.black,
                        fontSize: 10,
                        height: 1.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.headlineMedium?.copyWith(
                        color: AppColors.black,
                        fontSize: responsiveSize(context, 18, 21, md: 20),
                        height: 1.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProjectData extends StatelessWidget {
  const ProjectData({
    super.key,
    required this.title,
    required this.subtitle,
    required this.controller,
    this.width = double.infinity,
    this.titleStyle,
    this.subtitleStyle,
  });

  final String title;
  final String subtitle;
  final double width;
  final AnimationController controller;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    TextStyle? defaultTitleStyle = textTheme.titleMedium?.copyWith(
      color: AppColors.black,
      fontSize: 17,
    );
    TextStyle? defaultSubtitleStyle = textTheme.bodyLarge?.copyWith(
      fontSize: 15,
    );

    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedTextSlideBoxTransition(
            width: width,
            maxLines: 2,
            coverColor: AppColors.white,
            controller: controller,
            text: title,
            textStyle: titleStyle ?? defaultTitleStyle,
          ),
          SpaceH12(),
          AnimatedPositionedText(
            width: width,
            maxLines: 2,
            controller: CurvedAnimation(
              parent: controller,
              curve: Animations.textSlideInCurve,
            ),
            text: subtitle,
            textStyle: subtitleStyle ?? defaultSubtitleStyle,
          ),
        ],
      ),
    );
  }
}
