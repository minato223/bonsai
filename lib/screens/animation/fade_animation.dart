// ignore_for_file: must_be_immutable

import 'package:bonsai/constants/app_typography.dart';
import 'package:flutter/material.dart';

class FadeAnimation extends StatelessWidget {
  Widget child;
  int duration;
  FadeAnimation({super.key, required this.child, this.duration = 500});

  @override
  Widget build(BuildContext context) {
    final typo = AppTypography(context);
    return Padding(
        padding: EdgeInsets.symmetric(
            vertical: typo.SCREEN_PADDING / 4, horizontal: typo.SCREEN_PADDING),
        child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 10, end: 0),
            duration: Duration(milliseconds: duration),
            builder: ((context, value, child) {
              double opacity = (((value - 10) * (-1)).toInt() / 10);
              return Transform.translate(
                offset: Offset(0, value),
                child: Opacity(opacity: opacity, child: child),
              );
            }),
            child: child));
  }
}
