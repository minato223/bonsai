// ignore_for_file: must_be_immutable

import 'package:bonsai/constants/app_images.dart';
import 'package:bonsai/constants/app_typography.dart';
import 'package:bonsai/models/bonsai.dart';
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
                    image: AssetImage(AppImages.bg), fit: BoxFit.cover)),
          ),
          Container(
            height: typo.height,
            width: typo.width,
            color: Colors.black54,
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
                      Text(
                        bonsai.name,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: typo.h1),
                      ),
                      SizedBox(height: typo.SCREEN_PADDING),
                      Text(
                        bonsai.description,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: typo.h3),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  child: Container(
                    height: typo.width * .1,
                    width: typo.width * .1,
                    margin: EdgeInsets.only(left: typo.SCREEN_PADDING / 2),
                    decoration: const BoxDecoration(
                        color: Colors.black, shape: BoxShape.circle),
                    child: const Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
