import 'package:bonsai/constants/app_colors.dart';
import 'package:bonsai/constants/app_constant.dart';
import 'package:bonsai/constants/app_icons.dart';
import 'package:bonsai/constants/app_images.dart';
import 'package:bonsai/constants/app_typography.dart';
import 'package:bonsai/models/bonsai.dart';
import 'package:bonsai/screens/home/widgets/home_app_bar.dart';
import 'package:bonsai/screens/home/widgets/home_search_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> _navIcons = [
    AppIcons.home,
    AppIcons.tablerplant,
    AppIcons.shopping,
    AppIcons.riuserline,
  ];
  final List<String> _menu = [
    "All",
    "Outdoors",
    "Indoors",
    "Garden",
  ];
  final List<Bonsai> _categories = AppConstant.bonsaiCategories;
  late String _selectCategory;
  @override
  void initState() {
    super.initState();
    _selectCategory = _menu[0];
  }

  @override
  Widget build(BuildContext context) {
    final typo = AppTypography(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: ListView(
        children: [
          HomeAppBar(),
          HomeSearchBar(),
          SizedBox(
            height: typo.height * .1,
            child: ListView.separated(
              padding: EdgeInsets.all(typo.SCREEN_PADDING),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: _menu.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectCategory = _menu[index];
                    });
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: typo.SCREEN_PADDING),
                    decoration: BoxDecoration(
                        color: _selectCategory == _menu[index]
                            ? AppColors.mainColor
                            : null,
                        borderRadius: BorderRadius.circular(typo.h3)),
                    child: FittedBox(
                        child: Text(
                      _menu[index],
                      style: TextStyle(
                          color: _selectCategory == _menu[index]
                              ? Colors.white
                              : null,
                          fontWeight: _selectCategory == _menu[index]
                              ? FontWeight.w500
                              : null),
                    )),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: typo.SCREEN_PADDING / 3,
                );
              },
            ),
          ),
          SizedBox(
            height: typo.height * .4,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: typo.SCREEN_PADDING),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: typo.width * .5,
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
                                      bottomRight:
                                          Radius.circular(typo.width * .15))),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: Text(
                                      _categories[index].name,
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
                                        child: Image.asset(
                                            _categories[index].imagePath),
                                      ))
                                ],
                              ),
                            )),
                        SizedBox(height: typo.SCREEN_PADDING),
                        Expanded(
                            flex: 5,
                            child: Padding(
                              padding:
                                  EdgeInsets.all(typo.SCREEN_PADDING / 1.5),
                              child: Stack(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        _categories[index].description,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyle(
                                            color: AppColors.textColor),
                                      ),
                                      Text(
                                        "\$${_categories[index].price}",
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
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: typo.SCREEN_PADDING * 2,
                );
              },
            ),
          ),
          SizedBox(height: typo.SCREEN_PADDING * 2.5),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: typo.width * .5,
              height: typo.height * .3,
              margin: EdgeInsets.fromLTRB(typo.SCREEN_PADDING, 0,
                  typo.SCREEN_PADDING, typo.SCREEN_PADDING),
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
                      flex: 1,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 6,
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
                                      bottomRight:
                                          Radius.circular(typo.width * .15))),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Transform(
                                        transform: Matrix4.identity()
                                          ..setEntry(3, 2, 0.001)
                                          ..scale(2.0)
                                          ..translate(-typo.SCREEN_PADDING * 2,
                                              -typo.SCREEN_PADDING * 3 / 2),
                                        child: Image.asset(AppImages.img10)),
                                  ),
                                  Expanded(
                                      flex: 6,
                                      child: IntrinsicHeight(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Montserrat",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: typo.h2,
                                                  color: AppColors.mainColor,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              "\$56",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: typo.h2 + 5,
                                                  color:
                                                      AppColors.textBoldColor,
                                                  fontWeight: FontWeight.w500),
                                            )
                                          ],
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          ),
                          const Expanded(flex: 1, child: SizedBox())
                        ],
                      )),
                  SizedBox(height: typo.SCREEN_PADDING / 2),
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.all(typo.SCREEN_PADDING / 1.5),
                        child: Row(
                          children: [
                            const Expanded(flex: 3, child: SizedBox()),
                            Expanded(
                              flex: 6,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Ipsum deserunt deserunt proident deserunt voluptate.",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style:
                                          TextStyle(color: AppColors.textColor),
                                    ),
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
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
