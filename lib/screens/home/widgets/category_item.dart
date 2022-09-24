import 'package:bonsai/constants/app_colors.dart';
import 'package:bonsai/constants/app_typography.dart';
import 'package:bonsai/models/bonsai.dart';
import 'package:bonsai/screens/detail/detail.dart';
import 'package:flutter/material.dart';

Widget category_item_builder(Bonsai bonsai) {
  return Builder(builder: (context) {
    final typo = AppTypography(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => Detail(bonsai: bonsai)));
      },
      child: Container(
        width: typo.width * .5,
        margin: EdgeInsets.only(
            left: typo.SCREEN_PADDING, right: typo.SCREEN_PADDING),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(typo.h1),
                bottomRight: Radius.circular(typo.h1)),
            gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(23, 0, 0, 0),
                  Color.fromARGB(4, 0, 0, 0),
                  Colors.transparent
                ],
                begin: Alignment.bottomRight,
                tileMode: TileMode.mirror,
                stops: [0, .2, .3],
                end: Alignment.topLeft)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 4,
                child: Container(
                  padding: EdgeInsets.all(typo.SCREEN_PADDING / 2),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      // ignore: prefer_const_literals_to_create_immutables
                      boxShadow: [
                        const BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: Offset(5, 5))
                      ],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(typo.h1),
                          bottomRight: Radius.circular(typo.width * .15))),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Text(
                          bonsai.name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: typo.h2,
                              color: AppColors.mainColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Expanded(
                          flex: 5,
                          child: Transform(
                            transform: Matrix4.identity()
                              ..setEntry(3, 2, 0.001)
                              ..scale(1.4),
                            child: Hero(
                                tag: bonsai,
                                child: Image.asset(bonsai.imagePath)),
                          ))
                    ],
                  ),
                )),
            SizedBox(height: typo.SCREEN_PADDING),
            Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.all(typo.SCREEN_PADDING / 1.5),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            bonsai.description,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(color: AppColors.textColor),
                          ),
                          Text(
                            "\$${bonsai.price}",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: typo.h2 + 10,
                                color: AppColors.textBoldColor,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.add_circle,
                                size: typo.h1 * 1.5,
                                color: AppColors.mainColor)),
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  });
}
