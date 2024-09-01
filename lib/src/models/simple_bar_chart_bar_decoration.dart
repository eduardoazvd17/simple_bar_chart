import 'package:flutter/material.dart';

class SimpleBarChartBarDecoration {
  final double barWidth;
  final bool showAsProgress;
  final Color? yColor;
  final Color? y2Color;

  const SimpleBarChartBarDecoration({
    this.barWidth = 15,
    this.showAsProgress = true,
    this.yColor,
    this.y2Color,
  });
}
