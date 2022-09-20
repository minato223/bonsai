// ignore_for_file: non_constant_identifier_names

import 'package:flutter/widgets.dart';

class AppTypography {
  BuildContext context;
  late double _width;
  late double _height;
  AppTypography(this.context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
  }
  double get width => _width;
  double get height => _height;
  double get padding => _width * .02;
  double get HEIGHT_DIVIDER_SIZE => .02 * _height;
  double get WIDTH_DIVIDER_SIZE => .05 * _width;
  double get SCREEN_PADDING => .05 * _width;
  double get h1 => _width * .065;
  double get h2 => _width * .045;
  double get h3 => _width * .038;
}
