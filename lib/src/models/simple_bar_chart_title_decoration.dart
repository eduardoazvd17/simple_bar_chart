import 'package:simple_bar_chart/src/enums/y_title_position.dart';

class SimpleBarChartTitleDecoration {
  final double xHeightSpace;
  final double xWidthSpace;
  final bool showYTitles;
  final String Function(double)? yTitleTextFormatter;
  final bool fixedYTitles;
  final YTitlePosition yTitlePosition;

  const SimpleBarChartTitleDecoration({
    this.xHeightSpace = 40,
    this.xWidthSpace = 35,
    this.showYTitles = true,
    this.yTitleTextFormatter,
    this.fixedYTitles = false,
    this.yTitlePosition = YTitlePosition.both,
  });
}
