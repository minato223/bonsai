// ignore_for_file: non_constant_identifier_names

import 'package:bonsai/constants/app_colors.dart';
import 'package:bonsai/constants/app_typography.dart';
import 'package:flutter/material.dart';

Widget tab_item(
    {Function()? onclick, dynamic currentItem, dynamic selectItem}) {
  return Builder(builder: (context) {
    final typo = AppTypography(context);
    return GestureDetector(
      onTap: onclick,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: typo.SCREEN_PADDING),
        decoration: BoxDecoration(
            color: selectItem == currentItem ? AppColors.mainColor : null,
            borderRadius: BorderRadius.circular(typo.h3)),
        child: FittedBox(
            child: Text(
          currentItem,
          style: TextStyle(
              color: selectItem == currentItem ? Colors.white : null,
              fontWeight: selectItem == currentItem ? FontWeight.w500 : null),
        )),
      ),
    );
  });
}
