import 'package:cv_daniel/core/layout/adaptive.dart';
import 'package:cv_daniel/core/utils/functions.dart';
import 'package:cv_daniel/presentation/widgets/aerium_button.dart';
import 'package:cv_daniel/presentation/widgets/animated_text_slide_box_transition.dart';
import 'package:cv_daniel/presentation/widgets/app_logo.dart';
import 'package:cv_daniel/presentation/widgets/empty.dart';
import 'package:cv_daniel/presentation/widgets/nav_item.dart';
import 'package:cv_daniel/presentation/widgets/spaces.dart';
import 'package:cv_daniel/providers/language.dart';
import 'package:cv_daniel/values/strings.dart';
import 'package:cv_daniel/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
    required this.selectedRouteTitle,
    required this.selectedRouteName,
    required this.controller,
    this.selectedRouteTitleStyle,
    this.onMenuTap,
    this.onNavItemWebTap,
    this.hasSideTitle = true,
    this.selectedTitleColor = AppColors.letterColor,
    this.titleColor = AppColors.grey600,
    this.appLogoColor = AppColors.letterColor,
  });

  final String selectedRouteTitle;
  final String selectedRouteName;
  final AnimationController controller;
  final TextStyle? selectedRouteTitleStyle;
  final GestureTapCallback? onMenuTap;
  final bool hasSideTitle;
  final Color titleColor;
  final Color selectedTitleColor;
  final Color appLogoColor;
  final Function(String)? onNavItemWebTap;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        double screenWidth = sizingInformation.screenSize.width;
        if (screenWidth <= RefinedBreakpoints().tabletNormal) {
          return mobileNavBar(context);
        } else {
          return webNavBar(context);
        }
      },
    );
  }

  Widget mobileNavBar(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          child: Container(
            color: const Color.fromARGB(255, 245, 245, 245).withOpacity(.8),
            width: widthOfScreen(context),
            height: 85,
          ),
        ),
        Container(
          width: widthOfScreen(context),
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.PADDING_30,
            vertical: Sizes.PADDING_24,
          ),
          child: Row(
            children: [
              AppLogo(
                fontSize: Sizes.TEXT_SIZE_40,
                titleColor: appLogoColor,
              ),
              const Spacer(),
              InkWell(
                onTap: onMenuTap,
                child: Icon(
                  FeatherIcons.menu,
                  size: Sizes.TEXT_SIZE_30,
                  color: appLogoColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget webNavBar(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, _) {
        TextTheme textTheme = Theme.of(context).textTheme;
        TextStyle? style = selectedRouteTitleStyle ??
            textTheme.bodyLarge?.copyWith(
              color: AppColors.letterColor,
              fontWeight: FontWeight.w400,
              fontSize: Sizes.TEXT_SIZE_12,
            );

        return Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                color: const Color.fromARGB(255, 245, 245, 245).withOpacity(.8),
                width: widthOfScreen(context),
                height: 100,
              ),
            ),
            Container(
              width: widthOfScreen(context),
              height: heightOfScreen(context),
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.PADDING_40,
                vertical: Sizes.PADDING_24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      AppLogo(titleColor: appLogoColor),
                      const Spacer(),
                      ..._buildNavItems(context, languageProvider),
                      AeriumButton(
                        height: Sizes.HEIGHT_36,
                        hasIcon: false,
                        width: 150,
                        buttonColor: AppColors.white,
                        borderColor: appLogoColor,
                        onHoverColor: appLogoColor,
                        title: StringConst.DOWNLOAD.toUpperCase(),
                        onPressed: () {
                          Functions.downloadFromAssets(
                            "Curriculum_Jose_Daniel_Leon_Sanchez.docx",
                            "Curriculum_Jose_Daniel_Leon_Sanchez.docx",
                          );
                        },
                      ),
                      const SizedBox(width: 16),
                      Row(
                        children: [
                          Text(
                            languageProvider.locale.languageCode == 'es'
                                ? 'ES'
                                : 'EN',
                            style: TextStyle(
                              color: appLogoColor,
                              fontSize: Sizes.TEXT_SIZE_16,
                            ),
                          ),
                          Switch(
                            value: languageProvider.locale.languageCode == 'es',
                            onChanged: (_) {
                              languageProvider.toggleLanguage();
                              final currentRoute =
                                  ModalRoute.of(context)?.settings.name ?? '/';
                              Navigator.pushReplacementNamed(
                                  context, currentRoute);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  hasSideTitle
                      ? RotatedBox(
                          quarterTurns: 3,
                          child: AnimatedTextSlideBoxTransition(
                            controller: controller,
                            text: selectedRouteTitle.toUpperCase(),
                            textStyle: style,
                          ),
                        )
                      : const Empty(),
                  const Spacer(),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  List<Widget> _buildNavItems(
      BuildContext context, LanguageProvider languageProvider) {
    List<Widget> items = [];
    for (int index = 0; index < Data.menuItems.length; index++) {
      final menuItem = Data.menuItems[index];
      items.add(
        NavItem(
          controller: controller,
          title: languageProvider.locale.languageCode == 'es'
              ? menuItem.esTitle
              : menuItem.enTitle,
          route: menuItem.route,
          titleColor: titleColor,
          selectedColor: selectedTitleColor,
          index: index + 1,
          isSelected: menuItem.route == selectedRouteName,
          onTap: () {
            if (onNavItemWebTap != null) {
              onNavItemWebTap!(menuItem.route);
            }
          },
        ),
      );
      items.add(SpaceW24());
    }
    return items;
  }
}

class NavItemData {
  final String enTitle;
  final String esTitle;
  final String route;

  NavItemData({
    required this.enTitle,
    required this.esTitle,
    required this.route,
  });
}

class Data {
  static List<NavItemData> menuItems = [
    NavItemData(enTitle: 'Home', esTitle: 'Inicio', route: '/home'),
    NavItemData(enTitle: 'About me', esTitle: 'Sobre mí', route: '/about'),
    NavItemData(enTitle: 'Works', esTitle: 'Trabajos', route: '/works'),

    NavItemData(
        enTitle: 'Experience', esTitle: 'Experiencia', route: '/experience'),
    NavItemData(enTitle: 'Contact', esTitle: 'Contacto', route: '/contact'),
    // Agrega más elementos según sea necesario
  ];
}
