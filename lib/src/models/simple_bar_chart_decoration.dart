import '../enums/enums.dart';
import 'models.dart';

class SimpleBarChartDecoration {
  final double height;
  final bool showScrollbar;
  final SingleBarWidgetPosition singleBarPosition;
  final SimpleBarChartTitleDecoration titleDecoration;
  final SimpleBarChartTooltipDecoration tooltipDecoration;
  final SimpleBarChartBarDecoration barDecoration;

  double get singleBarMaxHeight => height - (titleDecoration.xHeightSpace * 2);
  double get doubleBarMaxHeight => (height / 2) - titleDecoration.xHeightSpace;

  const SimpleBarChartDecoration({
    this.height = 300,
    this.showScrollbar = true,
    this.singleBarPosition = SingleBarWidgetPosition.bottom,
    this.titleDecoration = const SimpleBarChartTitleDecoration(),
    this.tooltipDecoration = const SimpleBarChartTooltipDecoration(),
    this.barDecoration = const SimpleBarChartBarDecoration(),
  });
}
