import 'package:bonsai/constants/app_colors.dart';
import 'package:bonsai/constants/app_images.dart';
import 'package:bonsai/constants/app_typography.dart';
import 'package:bonsai/screens/home/home.dart';
import 'package:flutter/material.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _animation = TweenSequence<double>([
      TweenSequenceItem<double>(tween: Tween(begin: .2, end: 1), weight: 1),
      TweenSequenceItem<double>(tween: Tween(begin: 1, end: .2), weight: 1)
    ]).animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final typo = AppTypography(context);
    return Scaffold(
        body: Container(
      height: typo.height,
      width: typo.width,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage(AppImages.landingBg))),
      child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 1, end: 0),
          duration: const Duration(milliseconds: 800),
          onEnd: () {
            _controller.repeat();
          },
          curve: Curves.easeOut,
          builder: ((context, value, child) {
            return Transform.translate(
              offset: Offset(typo.width * value, 0.0),
              child: Opacity(
                opacity: (value - 1) * (-1),
                child: Align(
                  alignment: const Alignment(1, .4),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Home()));
                    },
                    child: Container(
                      width: typo.width * .5,
                      padding: EdgeInsets.all(typo.SCREEN_PADDING / 1.3),
                      decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(typo.SCREEN_PADDING),
                            bottomLeft: Radius.circular(typo.SCREEN_PADDING),
                          )),
                      child: AnimatedBuilder(
                        animation: _controller,
                        builder: (context, child) {
                          return Opacity(
                            opacity: _animation.value,
                            child: Text(
                              "Start",
                              style: TextStyle(
                                  fontSize: typo.h2,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            );
          })),
    ));
  }
}
