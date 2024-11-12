import 'package:cv_daniel/core/layout/adaptive.dart';
import 'package:cv_daniel/core/utils/functions.dart';
import 'package:cv_daniel/presentation/pages/project_detail/widgets/about_project.dart';
import 'package:cv_daniel/presentation/pages/project_detail/widgets/next_project.dart';
import 'package:cv_daniel/presentation/pages/widgets/simple_footer.dart';
import 'package:cv_daniel/presentation/widgets/animated_text_slide_box_transition.dart';
import 'package:cv_daniel/presentation/widgets/animated_wave.dart';
import 'package:cv_daniel/presentation/widgets/content_area.dart';
import 'package:cv_daniel/presentation/widgets/custom_spacer.dart';
import 'package:cv_daniel/presentation/widgets/empty.dart';
import 'package:cv_daniel/presentation/widgets/page_wrapper.dart';
import 'package:cv_daniel/presentation/widgets/project_item.dart';
import 'package:cv_daniel/presentation/widgets/spaces.dart';
import 'package:cv_daniel/values/strings.dart';
import 'package:cv_daniel/values/values.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ProjectDetailArguments {
  final ProjectItemData data;
  final List<ProjectItemData> dataSource;
  final int currentIndex;
  final ProjectItemData? nextProject;
  final bool hasNextProject;

  ProjectDetailArguments({
    required this.dataSource,
    required this.data,
    required this.currentIndex,
    required this.hasNextProject,
    this.nextProject,
  });
}

class ProjectDetailPage extends StatefulWidget {
  static String projectDetailPageRoute = StringConst.PROJECT_DETAIL_PAGE;
  const ProjectDetailPage({super.key});

  @override
  _ProjectDetailPageState createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState extends State<ProjectDetailPage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _waveController;
  late AnimationController _aboutProjectController;
  late AnimationController _projectDataController;
  late ProjectDetailArguments projectDetails;
  double waveLineHeight = 100;

  @override
  void initState() {
    _waveController = AnimationController(
      vsync: this,
      duration: Animations.waveDuration,
    )..repeat();
    _controller = AnimationController(
      vsync: this,
      duration: Animations.slideAnimationDurationLong,
    );
    _aboutProjectController = AnimationController(
      vsync: this,
      duration: Animations.slideAnimationDurationShort,
    );
    _waveController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _waveController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _waveController.forward();
      }
    });
    _projectDataController = AnimationController(
      vsync: this,
      duration: Animations.slideAnimationDurationShort,
    );
    _waveController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _waveController.dispose();
    _aboutProjectController.dispose();
    _controller.dispose();
    super.dispose();
  }

  ProjectDetailArguments getArguments() {
    projectDetails =
        ModalRoute.of(context)!.settings.arguments as ProjectDetailArguments;
    return projectDetails;
  }

  @override
  Widget build(BuildContext context) {
    getArguments();
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? coverTitleStyle = textTheme.displayMedium?.copyWith(
      color: Colors.white,
      fontSize: 50,
      shadows: [
        Shadow(
          offset: Offset(0, -4.0), // Dirección de la sombra blanca hacia arriba
          blurRadius: 10.0, // Ajusta la intensidad del desenfoque
          color: Colors.black.withOpacity(0.3), // Color de la sombra blanca
        ),
        Shadow(
          offset: Offset(0, 4.0), // Dirección de la sombra negra hacia abajo
          blurRadius: 10.0, // Ajusta la intensidad del desenfoque
          color: Colors.black.withOpacity(0.7), // Color de la sombra negra
        ),
      ],
    );
    TextStyle? coverSubtitleStyle = textTheme.bodyLarge?.copyWith(
      color: Colors.white,
      shadows: [
        Shadow(
          offset: Offset(0, -4.0), // Dirección de la sombra blanca hacia arriba
          blurRadius: 10.0, // Ajusta la intensidad del desenfoque
          color: Colors.black.withOpacity(0.3), // Color de la sombra blanca
        ),
        Shadow(
          offset: Offset(0, 4.0), // Dirección de la sombra negra hacia abajo
          blurRadius: 10.0, // Ajusta la intensidad del desenfoque
          color: Colors.black.withOpacity(0.7), // Color de la sombra negra
        ),
      ],
    );
    EdgeInsetsGeometry padding = EdgeInsets.only(
      left: responsiveSize(
        context,
        assignWidth(context, 0.10),
        assignWidth(context, 0.15),
      ),
      right: responsiveSize(
        context,
        assignWidth(context, 0.10),
        assignWidth(context, 0.25),
      ),
    );
    double contentAreaWidth = responsiveSize(
      context,
      assignWidth(context, 0.60),
      assignWidth(context, 0.80),
    );
    return PageWrapper(
      backgroundColor: AppColors.white,
      selectedRoute: ProjectDetailPage.projectDetailPageRoute,
      hasSideTitle: false,
      selectedPageName: StringConst.PROJECT,
      navBarAnimationController: _controller,
      navBarTitleColor: projectDetails.data.navTitleColor,
      navBarSelectedTitleColor: projectDetails.data.navSelectedTitleColor,
      appLogoColor: projectDetails.data.appLogoColor,
      onLoadingAnimationDone: () {
        _controller.forward();
      },
      child: ListView(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          SizedBox(
            width: widthOfScreen(context),
            height: heightOfScreen(context),
            child: Stack(
              children: [
                Image.asset(
                  projectDetails.data.coverUrl,
                  fit: BoxFit.cover,
                  width: widthOfScreen(context),
                  height: heightOfScreen(context),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: waveLineHeight + 40),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedTextSlideBoxTransition(
                          controller: _controller,
                          widthFactor: 1.20,
                          text: "${projectDetails.data.title}.",
                          coverColor: projectDetails.data.primaryColor,
                          textStyle: coverTitleStyle,
                          textAlign: TextAlign.center,
                        ),
                        SpaceH20(),
                        AnimatedTextSlideBoxTransition(
                          controller: _controller,
                          widthFactor: 1.20,
                          text: projectDetails.data.category,
                          coverColor: projectDetails.data.primaryColor,
                          textStyle: coverSubtitleStyle,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: AnimatedWaveLine(
                      height: waveLineHeight,
                      controller: _waveController,
                      color: projectDetails.data.primaryColor,
                    ),
                  ),
                )
              ],
            ),
          ),
          CustomSpacer(heightFactor: 0.15),
          VisibilityDetector(
            key: const Key('about-project'),
            onVisibilityChanged: (visibilityInfo) {
              double visiblePercentage = visibilityInfo.visibleFraction * 100;
              if (visiblePercentage > 40) {
                _aboutProjectController.forward();
              }
            },
            child: Padding(
              padding: padding,
              child: ContentArea(
                width: contentAreaWidth,
                child: Aboutproject(
                  projectData: projectDetails.data,
                  controller: _aboutProjectController,
                  projectDataController: _projectDataController,
                  width: contentAreaWidth,
                ),
              ),
            ),
          ),
          CustomSpacer(heightFactor: 0.15),
          ..._buildProjectAlbum(projectDetails.data.projectAssets),
          projectDetails.hasNextProject
              ? CustomSpacer(heightFactor: 0.15)
              : Empty(),
          projectDetails.hasNextProject
              ? Padding(
                  padding: padding,
                  child: ContentArea(
                    width: contentAreaWidth,
                    child: NextProject(
                      width: contentAreaWidth,
                      nextProject: projectDetails.nextProject!,
                      navigateToNextProject: () {
                        Functions.navigateToProject(
                          context: context,
                          dataSource: projectDetails.dataSource,
                          currentProject: projectDetails.nextProject!,
                          currentProjectIndex: projectDetails.currentIndex + 1,
                        );
                      },
                    ),
                  ),
                )
              : Empty(),
          projectDetails.hasNextProject
              ? CustomSpacer(heightFactor: 0.15)
              : Empty(),
          SimpleFooter(),
        ],
      ),
    );
  }

  List<Widget> _buildProjectAlbum(List<String> data) {
    List<Widget> items = [];

    for (int index = 0; index < data.length; index++) {
      items.add(
        Image.asset(
          data[index],
          fit: BoxFit.cover,
        ),
      );
    }

    return items;
  }
}
