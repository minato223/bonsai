// ignore_for_file: non_constant_identifier_names

import 'package:bonsai/constants/app_colors.dart';
import 'package:bonsai/constants/app_constant.dart';
import 'package:bonsai/constants/app_icons.dart';
import 'package:bonsai/constants/app_typography.dart';
import 'package:bonsai/models/bonsai.dart';
import 'package:bonsai/screens/detail/detail.dart';
import 'package:bonsai/screens/home/widgets/category_item.dart';
import 'package:bonsai/screens/home/widgets/home_app_bar.dart';
import 'package:bonsai/screens/home/widgets/home_nav_bar.dart';
import 'package:bonsai/screens/home/widgets/home_search_bar.dart';
import 'package:bonsai/screens/home/widgets/list_item.dart';
import 'package:bonsai/screens/home/widgets/tab_item.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  final GlobalKey<AnimatedListState> _tabKey = GlobalKey<AnimatedListState>();
  final GlobalKey<AnimatedListState> _categoryKey =
      GlobalKey<AnimatedListState>();
  final Duration _animationDuration = const Duration(milliseconds: 300);
  final List<Bonsai> _bonsaiCategories = [];
  final List<String> _tabList = [];
  final List<String> _navIcons = [
    AppIcons.home,
    AppIcons.tablerplant,
    AppIcons.shopping,
    AppIcons.riuserline,
  ];
  late String _selectCategory;
  @override
  void initState() {
    super.initState();
    _selectCategory = AppConstant.tabItemList[0];
    startTabAnimation();
    startCategoryAnimation();
  }

  startTabAnimation() async {
    Future f = Future(() {});
    for (var tabItem in AppConstant.tabItemList) {
      f = f.then((value) {
        addBonsaiTabItem(tabItem);
        return Future.delayed(_animationDuration);
      });
    }
    f.then((value) {
      setState(() {});
    });
  }

  startCategoryAnimation() async {
    Future f = Future(() {});
    for (var category in AppConstant.bonsaiCategories) {
      f = f.then((value) {
        addBonsaiCategoryItem(category);
        return Future.delayed(_animationDuration);
      });
    }
  }

  addBonsaiTabItem(String tab) {
    int index = _tabList.length;
    _tabList.insert(index, tab);
    _tabKey.currentState?.insertItem(index, duration: _animationDuration);
  }

  addBonsaiCategoryItem(Bonsai bonsai) {
    int index = _bonsaiCategories.length;
    _bonsaiCategories.insert(index, bonsai);
    _categoryKey.currentState?.insertItem(index, duration: _animationDuration);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final typo = AppTypography(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const HomeAppBar(),
              const HomeSearchBar(),
              SizedBox(
                height: typo.height * .1,
                child: AnimatedList(
                    key: _tabKey,
                    initialItemCount: _tabList.length,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: ((context, index, animation) {
                      return TweenAnimationBuilder(
                        tween: Tween<double>(begin: 0, end: 1),
                        duration: _animationDuration,
                        builder: (context, value, child) {
                          return Opacity(
                            // duration: Duration.zero,
                            opacity: value,
                            child: SlideTransition(
                                position: animation.drive(Tween<Offset>(
                                    begin: const Offset(0, 1),
                                    end: Offset.zero)),
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(
                                      index == 0 ? typo.SCREEN_PADDING : 0,
                                      typo.SCREEN_PADDING,
                                      typo.SCREEN_PADDING,
                                      typo.SCREEN_PADDING),
                                  child: tab_item(
                                      onclick: () {
                                        setState(() {
                                          _selectCategory = _tabList[index];
                                        });
                                      },
                                      currentItem: _tabList[index],
                                      selectItem: _selectCategory),
                                )),
                          );
                        },
                      );
                    })),
              ),
              _category_builder(),
              SizedBox(
                height: typo.SCREEN_PADDING * 3,
              ),
              ...AppConstant.bonsaiList.map(list_item_builder).toList(),
              SizedBox(
                height: typo.SCREEN_PADDING * 3,
              ),
            ],
          ),
          HomeNavBar(navIcons: _navIcons)
        ],
      ),
    );
  }

  Widget _category_builder() {
    return Builder(builder: (context) {
      final typo = AppTypography(context);
      return SizedBox(
        height: typo.height * .4,
        child: AnimatedList(
            key: _categoryKey,
            initialItemCount: _bonsaiCategories.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: ((context, index, animation) {
              return TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 1),
                duration: _animationDuration,
                builder: (context, value, child) {
                  return AnimatedOpacity(
                    duration: Duration.zero,
                    opacity: value,
                    child: SlideTransition(
                        position: animation.drive(Tween<Offset>(
                            begin: const Offset(1, 0), end: Offset.zero)),
                        child: category_item_builder(_bonsaiCategories[index])),
                  );
                },
              );
            })),
      );
    });
  }
}
