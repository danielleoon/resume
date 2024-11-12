import 'package:cv_daniel/core/layout/adaptive.dart';
import 'package:cv_daniel/presentation/pages/widgets/nav_bar.dart'
    as navBarWidget;
import 'package:cv_daniel/presentation/widgets/app_drawer.dart';
import 'package:cv_daniel/presentation/widgets/empty.dart';
import 'package:cv_daniel/values/values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'loading_slider.dart';
import '../../providers/language.dart';

class NavigationArguments {
  bool showUnVeilPageAnimation;
  bool reverseAnimationOnPop;

  NavigationArguments({
    this.showUnVeilPageAnimation = true,
    this.reverseAnimationOnPop = true,
  });
}

class PageWrapper extends StatefulWidget {
  const PageWrapper({
    super.key,
    required this.selectedRoute,
    required this.selectedPageName,
    required this.navBarAnimationController,
    required this.child,
    this.customLoadingAnimation = const Empty(),
    this.onLoadingAnimationDone,
    this.hasSideTitle = true,
    this.hasUnveilPageAnimation = true,
    this.reverseAnimationOnPop = true,
    this.backgroundColor,
    this.navBarTitleColor = AppColors.grey600,
    this.navBarSelectedTitleColor = AppColors.letterColor,
    this.appLogoColor = AppColors.letterColor,
  });

  final String selectedRoute;
  final String selectedPageName;
  final AnimationController navBarAnimationController;
  final VoidCallback? onLoadingAnimationDone;
  final Widget child;
  final Widget customLoadingAnimation;
  final bool hasSideTitle;
  final bool hasUnveilPageAnimation;
  final bool reverseAnimationOnPop;
  final Color? backgroundColor;
  final Color navBarTitleColor;
  final Color navBarSelectedTitleColor;
  final Color appLogoColor;

  @override
  _PageWrapperState createState() => _PageWrapperState();
}

class _PageWrapperState extends State<PageWrapper>
    with TickerProviderStateMixin {
  late AnimationController forwardSlideController;
  late AnimationController unveilPageSlideController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  Duration duration = const Duration(milliseconds: 1250);

  @override
  void initState() {
    forwardSlideController = AnimationController(
      vsync: this,
      duration: duration,
    );
    unveilPageSlideController = AnimationController(
      vsync: this,
      duration: duration,
    );

    if (widget.hasUnveilPageAnimation) {
      unveilPageSlideController.forward();
      unveilPageSlideController.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          widget.onLoadingAnimationDone?.call();
        }
      });
    }

    super.initState();
  }

  @override
  void dispose() {
    forwardSlideController.dispose();
    unveilPageSlideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (forwardSlideController.isCompleted && widget.reverseAnimationOnPop) {
        forwardSlideController.reverse();
      }
    });

    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, _) {
        return Scaffold(
          key: _scaffoldKey,
          backgroundColor: widget.backgroundColor,
          drawer: AppDrawer(
            controller: widget.navBarAnimationController,
            menuList: Data.menuItems,
            selectedItemRouteName: widget.selectedRoute,
          ),
          body: Stack(
            children: [
              widget.child,
              navBarWidget.NavBar(
                selectedRouteTitle: widget.selectedPageName,
                controller: widget.navBarAnimationController,
                selectedRouteName: widget.selectedRoute,
                hasSideTitle: widget.hasSideTitle,
                appLogoColor: widget.appLogoColor,
                titleColor: widget.navBarTitleColor,
                selectedTitleColor: widget.navBarSelectedTitleColor,
                onNavItemWebTap: (String route) {
                  forwardSlideController.forward();
                  forwardSlideController.addStatusListener((status) {
                    if (status == AnimationStatus.completed) {
                      Navigator.of(context).pushNamed(
                        route,
                        arguments: NavigationArguments(
                          showUnVeilPageAnimation: true,
                        ),
                      );
                    }
                  });
                },
                onMenuTap: () {
                  if (_scaffoldKey.currentState!.isEndDrawerOpen) {
                    _scaffoldKey.currentState?.openEndDrawer();
                  } else {
                    _scaffoldKey.currentState?.openDrawer();
                  }
                },
              ),
              LoadingSlider(
                controller: forwardSlideController,
                width: widthOfScreen(context),
                height: heightOfScreen(context),
              ),
              if (widget.hasUnveilPageAnimation)
                Positioned(
                  right: 0,
                  child: LoadingSlider(
                    controller: unveilPageSlideController,
                    curve: Curves.fastOutSlowIn,
                    width: widthOfScreen(context),
                    height: heightOfScreen(context),
                    isSlideForward: false,
                  ),
                )
              else
                widget.customLoadingAnimation,
            ],
          ),
        );
      },
    );
  }
}
