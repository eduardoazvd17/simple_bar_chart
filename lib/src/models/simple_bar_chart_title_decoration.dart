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
