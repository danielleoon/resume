import 'package:cv_daniel/core/layout/adaptive.dart';
import 'package:cv_daniel/core/utils/functions.dart';
import 'package:cv_daniel/presentation/pages/home/widgets/scroll_down.dart';
import 'package:cv_daniel/presentation/pages/widgets/socials.dart';
import 'package:cv_daniel/presentation/pages/works/works_page.dart';
import 'package:cv_daniel/presentation/widgets/animated_bubble_button.dart';
import 'package:cv_daniel/presentation/widgets/animated_line_through_text.dart';
import 'package:cv_daniel/presentation/widgets/animated_positioned_text.dart';
import 'package:cv_daniel/presentation/widgets/animated_positioned_widget.dart';
import 'package:cv_daniel/presentation/widgets/animated_slide_transtion.dart';
import 'package:cv_daniel/presentation/widgets/animated_text_slide_box_transition.dart';
import 'package:cv_daniel/presentation/widgets/spaces.dart';
import 'package:cv_daniel/values/strings.dart';
import 'package:cv_daniel/values/values.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

const kDuration = Duration(milliseconds: 600);

class HomePageHeader extends StatefulWidget {
  const HomePageHeader({
    super.key,
    required this.scrollToWorksKey,
    required this.controller,
  });

  final GlobalKey scrollToWorksKey;
  final AnimationController controller;
  @override
  _HomePageHeaderState createState() => _HomePageHeaderState();
}

class _HomePageHeaderState extends State<HomePageHeader>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late AnimationController rotationController;
  late AnimationController scrollDownButtonController;
  late Animation<Offset> animation;
  late Animation<Offset> scrollDownBtnAnimation;

  @override
  void initState() {
    scrollDownButtonController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    rotationController = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
    animation = Tween<Offset>(
      begin: const Offset(0, 0.05),
      end: const Offset(0, -0.05),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    rotationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        rotationController.reset();
        rotationController.forward();
        // rotationController.reverse();
      }
    });
    controller.forward();
    rotationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    scrollDownButtonController.dispose();
    rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = widthOfScreen(context);
    final double screenHeight = heightOfScreen(context);
    final EdgeInsets textMargin = EdgeInsets.only(
      left: responsiveSize(
        context,
        20,
        screenWidth * 0.15,
        sm: screenWidth * 0.15,
      ),
      top: responsiveSize(
        context,
        60,
        screenHeight * 0.25,
        sm: screenHeight * 0.25,
      ),
      bottom: responsiveSize(context, 20, 40),
    );
    final EdgeInsets padding = EdgeInsets.symmetric(
      horizontal: screenWidth * 0.1,
      vertical: screenHeight * 0.1,
    );
    final EdgeInsets imageMargin = EdgeInsets.only(
      right: responsiveSize(
        context,
        0,
        screenWidth * 0.0,
        sm: screenWidth * 0.0,
      ),
      top: responsiveSize(
        context,
        30,
        screenHeight * 0.20,
        sm: screenHeight * 0.25,
      ),
      bottom: responsiveSize(context, 20, 40),
    );

    return Container(
      //height: heightOfScreen(context) * 1.28,
      height: 1400,
      width: screenWidth,
      color: AppColors.accentColor2.withOpacity(0.35),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: assignHeight(context, 0.1),
            ),
            child: const Align(
              alignment: Alignment.topCenter,
              child: DiagonalLines(),
            ),
          ),
          ResponsiveBuilder(builder: (context, sizingInformation) {
            double screenWidth = sizingInformation.screenSize.width;
            if (screenWidth < RefinedBreakpoints().tabletNormal) {
              return SingleChildScrollView(
                  child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: padding,
                    child: Stack(
                      children: [
                        Image.asset(
                          ImagePath.IMAGE1,
                          width: screenWidth,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: padding.copyWith(top: 0),
                    child: SizedBox(
                      width: screenWidth,
                      child: AboutDev(
                        controller: widget.controller,
                        width: screenWidth,
                      ),
                    ),
                  ),
                ],
              ));
            } else {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: textMargin,
                    child: SizedBox(
                      width: screenWidth * 0.40,
                      child: AboutDev(
                        controller: widget.controller,
                        width: screenWidth * 0.40,
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.05),
                  /*Container(
                    margin: imageMargin,
                    child: AnimatedSlideTranstion(
                      controller: controller,
                      position: animation,
                      child: Stack(
                        children: [
                          /*RotationTransition(
                            turns: rotationController,
                            child: Image.asset(
                              ImagePath.DEV_SKILLS_2,
                              width: screenWidth * 0.35,
                            ),
                          ),*/
                          Image.asset(
                            ImagePath.IMAGE1,
                            width: screenWidth * 0.35,
                          ),
                        ],
                      ),
                    ),
                  ),
*/
                  Container(
                    margin: imageMargin,
                    child: Stack(
                      children: [
                        /*RotationTransition(
                            turns: rotationController,
                            child: Image.asset(
                              ImagePath.DEV_SKILLS_2,
                              width: screenWidth * 0.35,
                            ),
                          ),*/
                        Image.asset(
                          ImagePath.IMAGE1,
                          width: screenWidth * 0.35,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
          }),
          Positioned(
            right: 0,
            bottom: 0,
            child: ResponsiveBuilder(
              builder: (context, sizingInformation) {
                double screenWidth = sizingInformation.screenSize.width;
                if (screenWidth < RefinedBreakpoints().tabletNormal) {
                  return Container();
                } else {
                  return InkWell(
                    hoverColor: Colors.transparent,
                    onTap: () {
                      Scrollable.ensureVisible(
                        widget.scrollToWorksKey.currentContext!,
                        duration: kDuration,
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 24, bottom: 40),
                      child: MouseRegion(
                        onEnter: (e) => scrollDownButtonController.forward(),
                        onExit: (e) => scrollDownButtonController.reverse(),
                        child: AnimatedSlideTranstion(
                          controller: scrollDownButtonController,
                          beginOffset: const Offset(0, 0),
                          targetOffset: const Offset(0, 0.1),
                          child: ScrollDownButton(),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DiagonalLines extends StatelessWidget {
  const DiagonalLines({super.key});

  @override
  Widget build(BuildContext context) {
    final widthOfLines = responsiveSize(
      context,
      widthOfScreen(context),
      widthOfScreen(context),
    );

    return CustomPaint(
      size: Size(widthOfLines, widthOfLines),
      painter: DiagonalLinesPainter(),
    );
  }
}

class DiagonalLinesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 150.0 // Adjust thickness as needed
      ..style = PaintingStyle.stroke;

    final double width = size.width;
    final double height = size.height;

    // Extend the lines beyond the visible area
    const double extension =
        2.0; // How much beyond the visible area you want to extend
    const double separation = 150.0; // Separation between the lines

    // Line 1: Diagonal line from top-right to bottom-left
    canvas.drawLine(
      Offset(width * -extension + 85,
          height * -extension), // Start point extended outside
      Offset(width * (1 + extension) + 85,
          height * (1 + extension)), // End point extended outside
      paint,
    );

    // Line 2: Parallel diagonal line from top-right to bottom-left
    canvas.drawLine(
      Offset(width * -extension + separation + 500,
          height * -extension), // Start point offset outside and separated
      Offset(width * (1 + extension) + separation + 500,
          height * (1 + extension)), // End point offset outside and separated
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

// Assuming you have these methods:

class AboutDev extends StatefulWidget {
  const AboutDev({
    super.key,
    required this.controller,
    required this.width,
  });

  final AnimationController controller;
  final double width;

  @override
  _AboutDevState createState() => _AboutDevState();
}

class _AboutDevState extends State<AboutDev> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    EdgeInsetsGeometry margin = const EdgeInsets.only(left: 16);
    final CurvedAnimation curvedAnimation = CurvedAnimation(
      parent: widget.controller,
      curve: const Interval(0.6, 1.0, curve: Curves.fastOutSlowIn),
    );
    double textFontSize = responsiveSize(context, 24, 44, md: 32, sm: 28);
    double headerFontSize = responsiveSize(context, 30, 50, md: 38, sm: 34);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: margin,
          child: AnimatedTextSlideBoxTransition(
            controller: widget.controller,
            text: StringConst.WELCOME,
            width: widget.width,
            maxLines: 3,
            textStyle: textTheme.displayMedium?.copyWith(
              color: AppColors.letterColor,
              fontSize: headerFontSize,
            ),
          ),
        ),
        SpaceH30(),
        Container(
          margin: margin,
          child: AnimatedTextSlideBoxTransition(
            controller: widget.controller,
            text: StringConst.INTRODUCTION,
            width: widget.width,
            maxLines: 5,
            textStyle: textTheme.displayMedium?.copyWith(
              color: AppColors.letterColor,
              fontSize: textFontSize,
            ),
          ),
        ),
        Container(
          margin: margin,
          child: AnimatedTextSlideBoxTransition(
            controller: widget.controller,
            text: StringConst.DESCRIPTION,
            width: responsiveSize(
              context,
              widget.width * 0.75,
              widget.width,
              md: widget.width,
              sm: widget.width,
            ),
            maxLines: 3,
            textStyle: textTheme.displayMedium?.copyWith(
              color: AppColors.letterColor,
              fontSize: textFontSize,
            ),
          ),
        ),
        SpaceH30(),
        ResponsiveBuilder(
          builder: (context, sizingInformation) {
            double screenWidth = sizingInformation.screenSize.width;

            // Ajustar el ancho del contenedor según el tamaño de pantalla
            double containerWidth = responsiveSize(
              context,
              widget.width * .70,
              widget.width * .70,
              md: widget.width * .70,
              sm: widget.width * .70,
            );

            MainAxisAlignment rowAlignment = screenWidth > 600
                ? MainAxisAlignment.start
                : MainAxisAlignment.center;

            return Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                width: containerWidth,
                child: Row(
                  mainAxisAlignment: rowAlignment,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Image.asset(
                          ImagePath.BOSCH_LOGO,
                          width: containerWidth / 3,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          ImagePath.SIEMENS_LOGO,
                          width: containerWidth / 3,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Image.asset(
                          ImagePath.LEANCE_LOGO,
                          width: containerWidth / 3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        SpaceH30(),
        Container(
          margin: margin,
          child: AnimatedPositionedText(
            controller: curvedAnimation,
            width: widget.width,
            maxLines: 3,
            factor: 2,
            text: StringConst.DESCRIPTION2,
            textStyle: textTheme.bodyLarge?.copyWith(
                fontSize: responsiveSize(
                  context,
                  Sizes.TEXT_SIZE_16,
                  Sizes.TEXT_SIZE_18,
                ),
                height: 2,
                fontWeight: FontWeight.w400,
                color: AppColors.letterColor),
          ),
        ),
        SpaceH30(),
        AnimatedPositionedWidget(
          controller: curvedAnimation,
          width: 200,
          height: 60,
          child: AnimatedBubbleButton(
            color: AppColors.grey100,
            imageColor: AppColors.letterColor,
            startOffset: const Offset(0, 0),
            targetOffset: const Offset(0.1, 0),
            targetWidth: 200,
            startBorderRadius: const BorderRadius.all(
              Radius.circular(100.0),
            ),
            title: StringConst.SEE_MY_WORKS.toUpperCase(),
            titleStyle: textTheme.bodyLarge?.copyWith(
              color: AppColors.letterColor,
              fontSize: responsiveSize(
                context,
                Sizes.TEXT_SIZE_14,
                Sizes.TEXT_SIZE_16,
                sm: Sizes.TEXT_SIZE_15,
              ),
              fontWeight: FontWeight.w500,
            ),
            onTap: () {
              Navigator.pushNamed(context, WorksPage.worksPageRoute);
            },
          ),
        ),
        // SpaceH40(),
        Container(
          margin: margin,
          child: Wrap(
            spacing: 20,
            runSpacing: 20,
            children: _buildSocials(
              context: context,
              data: Data.socialData1,
            ),
          ),
        )
      ],
    );
  }

  List<Widget> _buildSocials({
    required BuildContext context,
    required List<SocialData> data,
  }) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? style = textTheme.bodyLarge?.copyWith(color: AppColors.grey750);
    TextStyle? slashStyle = textTheme.bodyLarge?.copyWith(
      color: AppColors.grey750,
      fontWeight: FontWeight.w400,
      fontSize: 18,
    );
    List<Widget> items = [];

    for (int index = 0; index < data.length; index++) {
      items.add(
        AnimatedLineThroughText(
          text: data[index].name,
          isUnderlinedByDefault: true,
          controller: widget.controller,
          hasSlideBoxAnimation: true,
          hasOffsetAnimation: true,
          isUnderlinedOnHover: false,
          onTap: () {
            Functions.launchUrl(data[index].url);
          },
          textStyle: style,
        ),
      );

      if (index < data.length - 1) {
        items.add(
          Text('/', style: slashStyle),
        );
      }
    }

    return items;
  }
}
