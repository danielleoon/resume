import 'package:cv_daniel/values/values.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    this.title = "Daniel León",
    this.titleColor = AppColors.letterColor,
    this.titleStyle,
    this.fontSize = 50,
  });

  final String title;
  final TextStyle? titleStyle;
  final Color titleColor;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImagePath.LOADING,
      color: AppColors.letterColor,
      height: 60,
      //width: 200,
    );
  }
}
