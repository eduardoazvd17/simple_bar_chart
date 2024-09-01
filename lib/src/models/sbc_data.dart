import 'dart:math';

/// Data model for the bar chart.
class SbcData {
  final List<int> xValues;
  final List<double> yValues;
  final List<double>? y2Values;
  final double xInterval;

  Set<double> get yRange => <double>{...yValues, ...(y2Values ?? [])};
  double get minY => yRange.reduce(min);
  double get maxY => yRange.reduce(max);
  int get minX => xValues.reduce(min);
  int get maxX => xValues.reduce(max);

  const SbcData({
    required this.xValues,
    required this.yValues,
    this.y2Values,
    this.xInterval = 1,
  });
}
