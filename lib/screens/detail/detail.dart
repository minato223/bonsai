// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:bonsai/constants/app_images.dart';
import 'package:bonsai/constants/app_typography.dart';
import 'package:bonsai/models/bonsai.dart';
import 'package:bonsai/screens/animation/fade_animation.dart';
import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  Bonsai bonsai;
  Detail({super.key, required this.bonsai});

  @override
  Widget build(BuildContext context) {
    final typo = AppTypography(context);
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: typo.height,
            width: typo.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.bg2), fit: BoxFit.cover)),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
              height: typo.height,
              width: typo.width,
              color: Colors.black54,
            ),
          ),
          Hero(
              tag: bonsai,
              child: Center(
                child: Transform.scale(
                  scale: 1.5,
                  child: Image.asset(bonsai.imagePath),
                ),
              )),
          Container(
            padding: EdgeInsets.all(typo.SCREEN_PADDING),
            margin: EdgeInsets.all(typo.SCREEN_PADDING),
            decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(typo.SCREEN_PADDING)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeAnimation(
                          child: Text(
                        bonsai.name,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: typo.h1),
                      )),
                      SizedBox(height: typo.SCREEN_PADDING),
                      FadeAnimation(
                        duration: 600,
                        child: Text(
                          bonsai.description,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: typo.h3),
                        ),
                      ),
                    ],
                  ),
                ),
                _roundedBtn(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: SafeArea(
              child: _roundedBtn(
                iconData: Icons.arrow_back_rounded,
                onclick: () {
                  Navigator.pop(context);
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _roundedBtn({IconData? iconData, Function()? onclick}) {
    return Builder(builder: (context) {
      final typo = AppTypography(context);
      return InkWell(
        onTap: onclick,
        child: Container(
          height: typo.width * .1,
          width: typo.width * .1,
          margin: EdgeInsets.only(left: typo.SCREEN_PADDING / 2),
          decoration:
              const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
          child: Icon(
            iconData ?? Icons.arrow_forward_rounded,
            color: Colors.white,
          ),
        ),
      );
    });
  }
}
