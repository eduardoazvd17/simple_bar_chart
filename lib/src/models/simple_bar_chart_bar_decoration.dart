import 'package:flutter/material.dart';

class SimpleBarChartBarDecoration {
  final double width;
  final bool showAsProgress;
  final Color? yColor;
  final Color? y2Color;

  const SimpleBarChartBarDecoration({
    this.width = 15,
    this.showAsProgress = true,
    this.yColor,
    this.y2Color,
  });
}
