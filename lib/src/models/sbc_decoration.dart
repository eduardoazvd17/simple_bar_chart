import '../enums/enums.dart';
import 'models.dart';

/// Decoration settings for the bar chart.
class SbcDecoration {
  final double height;
  final bool showScrollbar;
  final SingleBarPosition singleBarPosition;
  final SbcTitleDecoration titleDecoration;
  final SbcTooltipDecoration tooltipDecoration;
  final SbcBarDecoration barDecoration;

  double get singleBarMaxHeight => height - (titleDecoration.xHeightSpace * 2);
  double get doubleBarMaxHeight => (height / 2) - titleDecoration.xHeightSpace;

  const SbcDecoration({
    this.height = 300,
    this.showScrollbar = true,
    this.singleBarPosition = SingleBarPosition.bottom,
    this.titleDecoration = const SbcTitleDecoration(),
    this.tooltipDecoration = const SbcTooltipDecoration(),
    this.barDecoration = const SbcBarDecoration(),
  });
}
