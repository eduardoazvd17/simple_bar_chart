import 'package:flutter/material.dart';

/// Bars decoration settings for the bar chart.
class SbcBarDecoration {
  final double width;
  final bool showAsProgress;
  final Color? yColor;
  final Color? y2Color;

  const SbcBarDecoration({
    this.width = 15,
    this.showAsProgress = true,
    this.yColor,
    this.y2Color,
  });
}
