import 'package:bonsai/constants/app_colors.dart';
import 'package:bonsai/constants/app_icons.dart';
import 'package:bonsai/constants/app_typography.dart';
import 'package:bonsai/screens/animation/fade_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final typo = AppTypography(context);
    return FadeAnimation(
        child: Row(
      children: [
        RichText(
          text: TextSpan(
            text: 'Bon',
            style: TextStyle(
                color: Colors.black,
                fontSize: typo.h1,
                fontWeight: FontWeight.w300),
            children: <TextSpan>[
              TextSpan(
                  text: 'Sai',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: AppColors.textColor)),
            ],
          ),
        ),
        SvgPicture.asset(
          AppIcons.arcticons,
          width: typo.h1 * 2,
          color: AppColors.mainColor,
        )
      ],
    ));
  }
}
