import 'package:cv_daniel/core/layout/adaptive.dart';
import 'package:cv_daniel/presentation/widgets/animated_slide_transtion.dart';
import 'package:cv_daniel/values/values.dart';
import 'package:flutter/material.dart';

class SlidingBanner extends StatefulWidget {
  const SlidingBanner({super.key});

  @override
  _SlidingBannerState createState() => _SlidingBannerState();
}

class _SlidingBannerState extends State<SlidingBanner>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 8000),
    )..repeat();
    controller.forward();
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reset();
        controller.forward();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      width: widthOfScreen(context),
      height: assignHeight(context, 0.5),
      color: AppColors.letterColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedSlideTranstion(
            controller: controller,
            position: Tween<Offset>(
              begin: Offset.fromDirection(0, 0),
              end: Offset.fromDirection(1, 5),
            ).animate(
              CurvedAnimation(
                parent: controller,
                curve: Curves.ease,
              ),
            ),
            child: Text(
              "TITLE",
              style: textTheme.displaySmall?.copyWith(
                color: AppColors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
