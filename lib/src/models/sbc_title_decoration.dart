import 'package:simple_bar_chart/src/enums/y_title_position.dart';

/// Title decoration settings for the bar chart.
class SbcTitleDecoration {
  final double xHeightSpace;
  final double xWidthSpace;
  final bool showYTitles;
  final String Function(double)? yTitleTextFormatter;
  final bool fixedYTitles;
  final YTitlePosition yTitlePosition;

  const SbcTitleDecoration({
    this.xHeightSpace = 40,
    this.xWidthSpace = 35,
    this.showYTitles = true,
    this.yTitleTextFormatter,
    this.fixedYTitles = false,
    this.yTitlePosition = YTitlePosition.both,
  });
}
