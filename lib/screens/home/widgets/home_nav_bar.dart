// ignore_for_file: import_of_legacy_library_into_null_safe, must_be_immutable

import 'package:bonsai/constants/app_colors.dart';
import 'package:bonsai/constants/app_icons.dart';
import 'package:bonsai/constants/app_typography.dart';
import 'package:clip_shadow/clip_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeNavBar extends StatelessWidget {
  List<String> navIcons;
  HomeNavBar({super.key, required this.navIcons});

  @override
  Widget build(BuildContext context) {
    final typo = AppTypography(context);
    double iconSize = typo.height * .04;
    return Container(
      color: Colors.transparent,
      height: typo.height * .15,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipShadow(
            // ignore: prefer_const_literals_to_create_immutables
            boxShadow: [
              const BoxShadow(
                  color: Colors.black26,
                  offset: Offset.zero,
                  blurRadius: 10,
                  blurStyle: BlurStyle.outer),
            ],
            clipper: BottomNavClipper(),
            child: Container(
                color: Colors.white,
                height: typo.height * .1,
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(
                              2,
                              (index) => InkWell(
                                    child: SizedBox(
                                        height: iconSize,
                                        width: iconSize,
                                        child: SvgPicture.asset(
                                          navIcons[index],
                                          color: AppColors.mainColor,
                                        )),
                                  )),
                        )),
                    const Expanded(flex: 1, child: SizedBox()),
                    Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(2, (index) {
                            return InkWell(
                              child: SizedBox(
                                  height: iconSize,
                                  width: iconSize,
                                  child: SvgPicture.asset(navIcons[index + 2],
                                      color: AppColors.mainColor)),
                            );
                          }),
                        ))
                  ],
                )),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: InkWell(
              child: TweenAnimationBuilder(
                duration: const Duration(milliseconds: 600),
                tween: Tween<double>(begin: 0, end: 1),
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: value,
                    child: Container(
                      height: typo.width * .14,
                      width: typo.width * .14,
                      padding: EdgeInsets.all(typo.SCREEN_PADDING / 3),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 3,
                              color: Color.fromARGB(255, 233, 133, 133)),
                          color: AppColors.mainColor,
                          shape: BoxShape.circle),
                      child: SvgPicture.asset(
                        AppIcons.qrscanner,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BottomNavClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double x = size.width;
    double y = size.height;
    double ratio = x / 6;
    Path path = Path();
    path.moveTo(0, y);
    path.lineTo(0, y * .4);
    path.quadraticBezierTo(x * .01, y * .1, x * .08, 0);
    path.lineTo(2 * ratio, 0);
    double d = ratio / 4;
    path.quadraticBezierTo(
        (2 * ratio) + (2 * d), y * .1, (2 * ratio) + (3 * d), y * .5);
    path.quadraticBezierTo(
        (2 * ratio) + (4 * d), y * .85, (2 * ratio) + (5 * d), y * .5);
    path.quadraticBezierTo(
        (2 * ratio) + (6 * d), y * .1, (2 * ratio) + (8 * d), 0);
    path.lineTo(x * .92, 0);
    path.quadraticBezierTo(x * .99, y * .1, x, y * .4);
    path.lineTo(x, y);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
