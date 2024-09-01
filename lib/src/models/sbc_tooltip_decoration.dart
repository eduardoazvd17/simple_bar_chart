import 'package:flutter/material.dart';

/// Tooltip decoration settings for the bar chart.
class SbcTooltipDecoration {
  final Color? backgroundColor;
  final TooltipTriggerMode triggerMode;
  final Duration waitDuration;
  final EdgeInsets padding;
  final String Function(int x, double y)? yTextFormatter;
  final String Function(int x, double y)? y2TextFormatter;
  final Border? border;
  final double borderRadius;

  const SbcTooltipDecoration({
    this.backgroundColor,
    this.triggerMode = TooltipTriggerMode.tap,
    this.waitDuration = Duration.zero,
    this.padding = const EdgeInsets.all(15),
    this.yTextFormatter,
    this.y2TextFormatter,
    this.border,
    this.borderRadius = 14,
  });
}
