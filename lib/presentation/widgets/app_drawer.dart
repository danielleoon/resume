import 'package:cv_daniel/core/layout/adaptive.dart';
import 'package:cv_daniel/core/utils/functions.dart';
import 'package:cv_daniel/presentation/pages/home/home_page.dart';
import 'package:cv_daniel/presentation/pages/widgets/socials.dart';
import 'package:cv_daniel/presentation/widgets/app_logo.dart';
import 'package:cv_daniel/presentation/widgets/nav_item.dart';
import 'package:cv_daniel/presentation/widgets/page_wrapper.dart';
import 'package:cv_daniel/presentation/widgets/spaces.dart';
import 'package:cv_daniel/providers/language.dart';
import 'package:cv_daniel/values/strings.dart';
import 'package:cv_daniel/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({
    super.key,
    required this.menuList,
    required this.selectedItemRouteName,
    required this.controller,
    this.color = AppColors.letterColor,
    this.width,
    this.onClose,
  });

  final String selectedItemRouteName;
  final List<NavItemData> menuList;
  final Color color;
  final AnimationController controller;
  final double? width;
  final GestureTapCallback? onClose;

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer>
    with SingleTickerProviderStateMixin {
  static const Duration _initialDelayTime = Duration(milliseconds: 50);
  static const Duration _itemSlideTime = Duration(milliseconds: 400);
  static const Duration _staggerTime = Duration(milliseconds: 50);
  static const Duration _buttonDelayTime = Duration(milliseconds: 100);
  static const Duration _buttonTime = Duration(milliseconds: 400);
  late Duration _animationDuration;

  late AnimationController _staggeredController;
  final List<Interval> _itemSlideIntervals = [];

  @override
  void initState() {
    _animationDuration = _initialDelayTime +
        (_staggerTime * widget.menuList.length) +
        _buttonDelayTime +
        _buttonTime;
    _createAnimationIntervals();

    _staggeredController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..forward();
    super.initState();
  }

  void _createAnimationIntervals() {
    for (var i = 0; i < widget.menuList.length; ++i) {
      final startTime = _initialDelayTime + (_staggerTime * i);
      final endTime = startTime + _itemSlideTime;
      _itemSlideIntervals.add(
        Interval(
          startTime.inMilliseconds / _animationDuration.inMilliseconds,
          endTime.inMilliseconds / _animationDuration.inMilliseconds,
        ),
      );
    }
  }

  @override
  void dispose() {
    _staggeredController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? style = textTheme.bodyLarge?.copyWith(
      color: AppColors.grey500,
      fontSize: Sizes.TEXT_SIZE_10,
    );
    return Container(
      color: AppColors.letterColor,
      width: widget.width ?? widthOfScreen(context),
      height: heightOfScreen(context),
      child: Drawer(
        child: Container(
          color: widget.color,
          width: widget.width ?? widthOfScreen(context),
          height: heightOfScreen(context),
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(Sizes.PADDING_24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AppLogo(
                          fontSize: Sizes.TEXT_SIZE_40,
                          titleColor: AppColors.accentColor,
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: widget.onClose ??
                              () {
                                Navigator.pop(context);
                              },
                          child: Icon(
                            FeatherIcons.x,
                            size: Sizes.ICON_SIZE_30,
                            color: AppColors.accentColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        SizedBox(height: 20), // Espacio al inicio de la lista
                        ..._buildMenuList(
                            menuList: widget.menuList, context: context),
                        SpaceH30(),
                        _buildDrawerActions(context),
                        SizedBox(height: 20), // Espacio al final de la lista
                      ],
                    ),
                  ),
                  Text(
                    StringConst.COPYRIGHT,
                    style: style,
                  ),
                  SpaceH20(),
                ],
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  margin: EdgeInsets.only(
                    left: Sizes.MARGIN_24,
                    bottom: assignHeight(context, 0.1),
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Socials(
                      socialData: Data.socialData,
                      size: 18,
                      isHorizontal: false,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildMenuList({
    required BuildContext context,
    required List<NavItemData> menuList,
  }) {
    List<Widget> menuItems = [];
    for (var index = 0; index < menuList.length; index++) {
      menuItems.add(
        AnimatedBuilder(
          animation: _staggeredController,
          builder: (context, child) {
            final animationPercent = Curves.easeOut.transform(
              _itemSlideIntervals[index].transform(_staggeredController.value),
            );
            final opacity = animationPercent;
            final slideDistance = (1.0 - animationPercent) * 150;

            return Opacity(
              opacity: opacity,
              child: Transform.translate(
                offset: Offset(slideDistance, 0),
                child: child,
              ),
            );
          },
          child: NavItem(
            controller: widget.controller,
            onTap: () {
              if (menuList[index].route == HomePage.homePageRoute) {
                Navigator.of(context).pushNamed(
                  menuList[index].route,
                  arguments: NavigationArguments(
                    showUnVeilPageAnimation: true,
                  ),
                );
              } else {
                Navigator.of(context).pushNamed(menuList[index].route);
              }
            },
            index: index + 1,
            route: menuList[index].route,
            title: menuList[index].name,
            isMobile: true,
            isSelected: widget.selectedItemRouteName == menuList[index].route
                ? true
                : false,
          ),
        ),
      );
    }
    return menuItems;
  }

  Widget _buildDrawerActions(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, _) {
        final double actionWidth = responsiveSize(
          context,
          widthOfScreen(context) * 0.62,
          260,
          md: 280,
        );

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.PADDING_24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Idioma",
                  textAlign: TextAlign.center,
                  style: textTheme.bodyLarge?.copyWith(
                    color: AppColors.grey500,
                    fontSize: Sizes.TEXT_SIZE_14,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              SpaceH12(),
              Center(
                child: Container(
                  width: actionWidth,
                  height: 52,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: AppColors.letterColor,
                    border: Border.all(color: AppColors.grey700),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: languageProvider.locale.languageCode,
                      isExpanded: true,
                      icon: const Icon(
                        FeatherIcons.chevronDown,
                        color: AppColors.accentColor,
                        size: 18,
                      ),
                      dropdownColor: AppColors.letterColor,
                      borderRadius: BorderRadius.circular(14),
                      style: textTheme.bodyLarge?.copyWith(
                        color: AppColors.grey300,
                        fontSize: Sizes.TEXT_SIZE_16,
                        fontWeight: FontWeight.w400,
                      ),
                      selectedItemBuilder: (context) => const [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Español',
                            style: TextStyle(
                              color: AppColors.grey300,
                              fontSize: Sizes.TEXT_SIZE_16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'English',
                            style: TextStyle(
                              color: AppColors.grey300,
                              fontSize: Sizes.TEXT_SIZE_16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                      onChanged: (value) {
                        if (value == null) {
                          return;
                        }

                        languageProvider.setLanguage(value);
                        final currentRoute =
                            ModalRoute.of(context)?.settings.name ?? '/';
                        Navigator.pushReplacementNamed(context, currentRoute);
                      },
                      items: const [
                        DropdownMenuItem(
                          value: 'es',
                          child: Text('Español'),
                        ),
                        DropdownMenuItem(
                          value: 'en',
                          child: Text('English'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SpaceH20(),
              Center(
                child: InkWell(
                  onTap: () {
                    Functions.downloadFromAssets(
                      "assets/docs/Resume_Jose_Daniel_Leon_Sanchez_2026.pdf",
                      "Resume_Jose_Daniel_Leon_Sanchez_2026.pdf",
                    );
                  },
                  hoverColor: Colors.transparent,
                  child: Container(
                    width: actionWidth,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
                    decoration: BoxDecoration(
                      color: AppColors.letterColor,
                      border: Border.all(color: AppColors.grey700),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          FeatherIcons.download,
                          color: AppColors.accentColor,
                          size: 18,
                        ),
                        SpaceW12(),
                        Text(
                          StringConst.DOWNLOAD.toUpperCase(),
                          style: textTheme.bodyLarge?.copyWith(
                            color: AppColors.accentColor,
                            fontSize: Sizes.TEXT_SIZE_16,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
