import 'package:cv_daniel/core/layout/adaptive.dart';
import 'package:cv_daniel/core/utils/functions.dart';
import 'package:cv_daniel/presentation/widgets/empty.dart';
import 'package:cv_daniel/presentation/widgets/spaces.dart';
import 'package:cv_daniel/values/strings.dart';
import 'package:cv_daniel/values/values.dart';
import 'package:flutter/material.dart';

const double lineHeight = 2;
Color defaultLineColor = AppColors.letterColor;

class LoadingHomePageAnimation extends StatefulWidget {
  static String loadingPageRoute = StringConst.LOADING_PAGE;

  const LoadingHomePageAnimation({
    super.key,
    required this.text,
    required this.style,
    required this.onLoadingDone,
    this.lineColor,
  });
  final String text;
  final TextStyle? style;
  final VoidCallback onLoadingDone;
  final Color? lineColor;

  @override
  _LoadingHomePageAnimationState createState() =>
      _LoadingHomePageAnimationState();
}

class _LoadingHomePageAnimationState extends State<LoadingHomePageAnimation>
    with TickerProviderStateMixin {
  late AnimationController _fadeOutController;
  late AnimationController _containerController;
  late AnimationController _scaleOpacityController;
  late Animation<double> containerAnimation;
  late Animation<double> scaleAnimation;
  late Animation<double> opacityAnimation;
  late Animation<double> fadeAnimation;
  late Color lineColor;
  final Duration _scaleDuration = const Duration(milliseconds: 750);
  final Duration _leftRightContainerDuration =
      const Duration(milliseconds: 750);
  final Duration _containerDuration = const Duration(milliseconds: 2000);
  bool _leftRightAnimationStarted = false;
  bool _leftRightAnimationDone = false;
  bool _isAnimationOver = false;
  late Size size;
  late double textWidth;
  late double textHeight;

  @override
  void initState() {
    super.initState();
    setTextWidthAndHeight();
    lineColor = widget.lineColor ?? defaultLineColor;
    _scaleOpacityController = AnimationController(
      vsync: this,
      duration: _scaleDuration,
    );
    _containerController = AnimationController(
      vsync: this,
      duration: _containerDuration,
    );
    _fadeOutController = AnimationController(
      vsync: this,
      duration: _leftRightContainerDuration,
    );
    scaleAnimation = Tween<double>(begin: 0.9, end: 0.5).animate(
      CurvedAnimation(
        parent: _scaleOpacityController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    opacityAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _scaleOpacityController,
        curve: Curves.easeIn,
      ),
    );
    fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _fadeOutController,
        curve: Curves.easeIn,
      ),
    );
    containerAnimation = Tween<double>(begin: 0, end: textWidth).animate(
      CurvedAnimation(
        parent: _containerController,
        curve: Curves.ease,
      ),
    );
    _scaleOpacityController.forward();
    _scaleOpacityController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _containerController.forward();
        });
      }
    });
    _containerController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _leftRightAnimationStarted = true;
          _fadeOutController.forward();
        });
      }
    });

    _fadeOutController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _leftRightAnimationDone = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _fadeOutController.dispose();
    _scaleOpacityController.dispose();
    _containerController.dispose();
    super.dispose();
  }

  void setTextWidthAndHeight() {
    size = Functions.textSize(
      text: widget.text,
      style: widget.style,
    );
    textWidth = size.width;
    textHeight = size.height;
  }

  @override
  Widget build(BuildContext context) {
    setTextWidthAndHeight();
    double screenWidth = widthOfScreen(context);
    double screenHeight = heightOfScreen(context);
    double halfHeightOfScreen = screenHeight / 2;
    double widthOfLeftLine = assignWidth(context, 0.5) - (textWidth / 2);
    double widthOfRightLine = screenWidth - (widthOfLeftLine + textWidth);
    double leftContainerStart = (screenWidth / 2) - (textWidth / 2);

    return _isAnimationOver
        ? Empty()
        : Stack(
            children: [
              AnimatedContainer(
                width: screenWidth,
                height: _leftRightAnimationDone ? 0 : halfHeightOfScreen,
                duration: _scaleDuration,
                color: AppColors.primaryColor,
                onEnd: () {
                  widget.onLoadingDone();
                  setState(() {
                    _isAnimationOver = true;
                  });
                },
              ),
              Positioned(
                bottom: 0,
                child: AnimatedContainer(
                  width: screenWidth,
                  height: _leftRightAnimationDone ? 0 : halfHeightOfScreen,
                  duration: _scaleDuration,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(
                width: widthOfScreen(context),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          const Spacer(),
                          SizedBox(
                            width: textWidth,
                            child: FadeTransition(
                              opacity: fadeAnimation,
                              child: AnimatedBuilder(
                                animation: _scaleOpacityController,
                                child: Image.asset(
                                  ImagePath.LOADING,
                                  color: AppColors.letterColor,
                                  height: 100,
                                  width: 200,
                                ),
                                builder: (context, child) => Transform.scale(
                                  scale: 8 * scaleAnimation.value,
                                  alignment: Alignment.center,
                                  child: AnimatedOpacity(
                                    opacity: opacityAnimation.value,
                                    duration: _scaleDuration,
                                    child: child,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                      SpaceH20(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: widthOfLeftLine,
                            child: Stack(
                              children: [
                                Container(
                                  width: widthOfLeftLine,
                                  height: lineHeight,
                                  color: AppColors.letterColor,
                                ),
                                Positioned(
                                  child: AnimatedContainer(
                                    width: _leftRightAnimationStarted
                                        ? 0
                                        : leftContainerStart,
                                    height: lineHeight,
                                    color: AppColors.primaryColor,
                                    duration: _leftRightContainerDuration,
                                    // curve: Curves.ease,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          containerAnimationBuilder(
                            controller: _containerController,
                            animation: containerAnimation,
                            color: lineColor,
                          ),
                          SizedBox(
                            width: widthOfRightLine,
                            child: Stack(
                              children: [
                                Container(
                                  width: widthOfRightLine,
                                  height: lineHeight,
                                  color: AppColors.letterColor,
                                ),
                                Positioned(
                                  right: 0,
                                  child: AnimatedContainer(
                                    width: _leftRightAnimationStarted
                                        ? 0
                                        : widthOfRightLine,
                                    height: lineHeight,
                                    color: AppColors.primaryColor,
                                    duration: _leftRightContainerDuration,
                                    onEnd: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
  }

  Widget containerAnimationBuilder({
    required Animation<double> animation,
    required AnimationController controller,
    Color color = AppColors.letterColor,
  }) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => Container(
        height: lineHeight,
        width: animation.value,
        color: color,
      ),
    );
  }
}
