import 'package:flutter/material.dart';

class SimpleBarChartDecoration {
  final double height;
  final bool showScrollbar;
  final SingleBarWidgetPosition singleBarPosition;
  final SimpleBarChartTitleDecoration titleDecoration;
  final SimpleBarChartTooltipDecoration tooltipDecoration;
  final SimpleBarChartBarDecoration barDecoration;

  double get barMaxHeight => (height / 2) - titleDecoration.xHeightSpace;

  const SimpleBarChartDecoration({
    this.height = 300,
    this.showScrollbar = true,
    this.singleBarPosition = SingleBarWidgetPosition.top,
    this.titleDecoration = const SimpleBarChartTitleDecoration(),
    this.tooltipDecoration = const SimpleBarChartTooltipDecoration(),
    this.barDecoration = const SimpleBarChartBarDecoration(),
  });
}

class SimpleBarChartTitleDecoration {
  final double xHeightSpace;
  final double xWidthSpace;
  final bool showYTitles;
  final String Function(double)? yTitleTextFormatter;

  const SimpleBarChartTitleDecoration({
    this.xHeightSpace = 40,
    this.xWidthSpace = 35,
    this.showYTitles = true,
    this.yTitleTextFormatter,
  });
}

class SimpleBarChartTooltipDecoration {
  final Color? backgroundColor;
  final TooltipTriggerMode triggerMode;
  final Duration waitDuration;
  final EdgeInsets padding;
  final String Function(double)? yTextFormatter;
  final String Function(double)? y2TextFormatter;

  const SimpleBarChartTooltipDecoration({
    this.backgroundColor,
    this.triggerMode = TooltipTriggerMode.tap,
    this.waitDuration = Duration.zero,
    this.padding = const EdgeInsets.all(15),
    this.yTextFormatter,
    this.y2TextFormatter,
  });
}

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

enum SingleBarWidgetPosition {
  top,
  bottom,
}
