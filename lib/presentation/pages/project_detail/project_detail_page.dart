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
  ProjectDetailArguments? projectDetails;
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

  ProjectDetailArguments? getArguments() {
    final route = ModalRoute.of(context);
    final args = route?.settings.arguments;
    if (args is ProjectDetailArguments) {
      projectDetails = args;
      return projectDetails;
    }

    final routeName = route?.settings.name ?? "";
    final uri = Uri.tryParse(routeName);
    final segments = uri?.pathSegments ?? const <String>[];

    if (segments.length >= 2) {
      final routeId = segments[1];
      final project = Data.findProjectByRouteId(routeId);
      if (project != null) {
        final dataSource = Data.allProjects;
        final currentIndex = Data.indexOfProject(project);
        final hasNextProject =
            currentIndex >= 0 && currentIndex < dataSource.length - 1;
        final nextProject =
            hasNextProject ? dataSource[currentIndex + 1] : null;

        projectDetails = ProjectDetailArguments(
          dataSource: dataSource,
          data: project,
          currentIndex: currentIndex,
          hasNextProject: hasNextProject,
          nextProject: nextProject,
        );
      }
    }

    return projectDetails;
  }

  @override
  Widget build(BuildContext context) {
    getArguments();
    final details = projectDetails;
    if (details == null) {
      return PageWrapper(
        backgroundColor: AppColors.white,
        selectedRoute: ProjectDetailPage.projectDetailPageRoute,
        hasSideTitle: false,
        selectedPageName: StringConst.PROJECT,
        navBarAnimationController: _controller,
        onLoadingAnimationDone: () {
          _controller.forward();
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              "Proyecto no encontrado.",
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? coverTitleStyle = textTheme.displayMedium?.copyWith(
      color: Colors.white,
      fontSize: 50,
      shadows: [
        Shadow(
          offset: const Offset(0, 3),
          blurRadius: 14,
          color: Colors.black.withOpacity(0.55),
        ),
        Shadow(
          offset: const Offset(0, 10),
          blurRadius: 28,
          color: Colors.black.withOpacity(0.35),
        ),
        Shadow(
          offset: const Offset(0, 0),
          blurRadius: 6,
          color: Colors.black.withOpacity(0.20),
        ),
      ],
    );
    TextStyle? coverSubtitleStyle = textTheme.bodyLarge?.copyWith(
      color: Colors.white,
      shadows: [
        Shadow(
          offset: const Offset(0, 4),
          blurRadius: 18,
          color: Colors.black.withOpacity(0.90),
        ),
        Shadow(
          offset: const Offset(0, 12),
          blurRadius: 30,
          color: Colors.black.withOpacity(0.70),
        ),
        Shadow(
          offset: const Offset(0, 0),
          blurRadius: 8,
          color: Colors.black.withOpacity(0.45),
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
      navBarTitleColor: details.data.navTitleColor,
      navBarSelectedTitleColor: details.data.navSelectedTitleColor,
      appLogoColor: details.data.appLogoColor,
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
                  details.data.coverUrl,
                  fit: BoxFit.cover,
                  width: widthOfScreen(context),
                  height: heightOfScreen(context),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.05),
                        Colors.black.withOpacity(0.10),
                        Colors.black.withOpacity(0.55),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: waveLineHeight + 40),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 24,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.18),
                            Colors.black.withOpacity(0.48),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AnimatedTextSlideBoxTransition(
                            controller: _controller,
                            widthFactor: 1.20,
                            text: "${details.data.title}.",
                            coverColor: details.data.primaryColor,
                            textStyle: coverTitleStyle,
                            textAlign: TextAlign.center,
                          ),
                          SpaceH20(),
                          AnimatedTextSlideBoxTransition(
                            controller: _controller,
                            widthFactor: 1.20,
                            text: details.data.category,
                            coverColor: details.data.primaryColor,
                            textStyle: coverSubtitleStyle,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: AnimatedWaveLine(
                      height: waveLineHeight,
                      controller: _waveController,
                      color: details.data.primaryColor,
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
              if (visiblePercentage > 15 &&
                  !_aboutProjectController.isAnimating &&
                  !_aboutProjectController.isCompleted) {
                _aboutProjectController.forward();
              }
            },
            child: Padding(
              padding: padding,
              child: ContentArea(
                width: contentAreaWidth,
                child: Aboutproject(
                  projectData: details.data,
                  controller: _aboutProjectController,
                  projectDataController: _projectDataController,
                  width: contentAreaWidth,
                ),
              ),
            ),
          ),
          CustomSpacer(heightFactor: 0.15),
          ..._buildProjectAlbum(details.data.projectAssets),
          details.hasNextProject
              ? CustomSpacer(heightFactor: 0.15)
              : Empty(),
          details.hasNextProject
              ? Padding(
                  padding: padding,
                  child: ContentArea(
                    width: contentAreaWidth,
                    child: NextProject(
                      width: contentAreaWidth,
                      nextProject: details.nextProject!,
                      navigateToNextProject: () {
                        Functions.navigateToProject(
                          context: context,
                          dataSource: details.dataSource,
                          currentProject: details.nextProject!,
                          currentProjectIndex: details.currentIndex + 1,
                        );
                      },
                    ),
                  ),
                )
              : Empty(),
          details.hasNextProject
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
