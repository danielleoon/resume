import 'package:cv_daniel/presentation/widgets/spaces.dart';
import 'package:cv_daniel/values/strings.dart';
import 'package:cv_daniel/values/values.dart';
import 'package:flutter/material.dart';

class ScrollDownButton extends StatelessWidget {
  const ScrollDownButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RotatedBox(
          quarterTurns: 1,
          child: Text(
            StringConst.SCROLL_DOWN.toUpperCase(),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 12,
                  letterSpacing: 1.7,
                ),
          ),
        ),
        SpaceH16(),
        Image.asset(
          ImagePath.ARROW_DOWN,
          height: 24,
        ),
      ],
    );
  }
}
