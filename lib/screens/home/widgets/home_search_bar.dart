import 'package:bonsai/constants/app_colors.dart';
import 'package:bonsai/constants/app_typography.dart';
import 'package:bonsai/screens/animation/fade_animation.dart';
import 'package:flutter/material.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final typo = AppTypography(context);
    TextStyle style =
        TextStyle(color: AppColors.textColor, fontWeight: FontWeight.w500);
    return FadeAnimation(
        duration: 600,
        child: Row(
          children: [
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(typo.h3)),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search_rounded,
                        size: typo.h2,
                      )),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search",
                          hintStyle: style),
                    ),
                  ),
                ],
              ),
            )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications_none_rounded,
                  color: AppColors.textColor,
                ))
          ],
        ));
  }
}
