import 'package:flutter/material.dart';

import '../models/models.dart';

class SimpleBarChartWidget extends StatefulWidget {
  final SimpleBarChartData data;
  final SimpleBarChartDecoration decoration;
  final ScrollController? scrollController;
  const SimpleBarChartWidget({
    super.key,
    required this.data,
    this.decoration = const SimpleBarChartDecoration(),
    this.scrollController,
  });

  @override
  State<SimpleBarChartWidget> createState() => _SimpleBarChartWidgetState();
}

class _SimpleBarChartWidgetState extends State<SimpleBarChartWidget> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    if (widget.scrollController == null) {
      _scrollController = ScrollController();
    }
    super.initState();
  }

  @override
  void dispose() {
    if (widget.scrollController == null) {
      _scrollController.dispose();
    }
    super.dispose();
  }

  String _formatYTitle(double value) {
    if (widget.decoration.titleDecoration.yTitleTextFormatter != null) {
      return widget.decoration.titleDecoration.yTitleTextFormatter!.call(value);
    }

    final valueString = value.toStringAsFixed(2).replaceAll('.00', '');
    return valueString.endsWith('0') && valueString != '0'
        ? valueString.substring(0, valueString.length)
        : valueString;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.decoration.height,
      child: Scrollbar(
        thumbVisibility: widget.decoration.showScrollbar,
        controller: widget.scrollController ?? _scrollController,
        child: SingleChildScrollView(
          controller: widget.scrollController ?? _scrollController,
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Row(
              children: [
                if (widget.decoration.titleDecoration.showYTitles)
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: SizedBox(
                      height: widget.decoration.height - 30,
                      child: _yTitles,
                    ),
                  ),
                Row(
                  children: widget.data.xValues
                      .map(
                        (x) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1),
                          child: _chartWidget(x),
                        ),
                      )
                      .toList(),
                ),
                if (widget.decoration.titleDecoration.showYTitles)
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SizedBox(
                      height: widget.decoration.height - 30,
                      child: _yTitles,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _xTitle(int x, bool showLabel) {
    return SizedBox(
      height: widget.decoration.titleDecoration.xHeightSpace,
      width: showLabel
          ? widget.decoration.titleDecoration.xWidthSpace
          : widget.decoration.barDecoration.barWidth,
      child: Column(
        children: [
          const Divider(height: 0),
          Expanded(
            child: showLabel ? Center(child: Text('$x')) : const SizedBox(),
          ),
          if (widget.data.y2Values != null) const Divider(height: 0),
        ],
      ),
    );
  }

  Widget get _yTitles {
    final String maxString = _formatYTitle(widget.data.maxY);
    final String midString = _formatYTitle(widget.data.maxY / 2);
    final String minString = _formatYTitle(widget.data.minY);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: widget.data.y2Values == null
          ? [
              if (widget.decoration.singleBarPosition ==
                  SingleBarWidgetPosition.top)
                SizedBox(
                  height: widget.decoration.titleDecoration.xHeightSpace - 10,
                ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.decoration.singleBarPosition ==
                            SingleBarWidgetPosition.bottom
                        ? maxString
                        : minString),
                    Text(midString),
                    Text(widget.decoration.singleBarPosition ==
                            SingleBarWidgetPosition.top
                        ? maxString
                        : minString),
                  ],
                ),
              ),
              if (widget.decoration.singleBarPosition ==
                  SingleBarWidgetPosition.bottom)
                SizedBox(
                  height: widget.decoration.titleDecoration.xHeightSpace - 10,
                ),
            ]
          : [
              Text(maxString),
              Text(midString),
              Column(
                children: [
                  Text(minString),
                  const SizedBox(height: 20),
                  Text(minString),
                ],
              ),
              Text(midString),
              Text(maxString),
            ],
    );
  }

  Widget _chartWidget(int x) {
    final bool showLabel = x % widget.data.xInterval == 0;
    final double yValue =
        widget.data.yValues.length - 1 >= x ? widget.data.yValues[x] : 0;

    final double? y2Value = widget.data.y2Values == null
        ? null
        : widget.data.y2Values!.length - 1 >= x
            ? widget.data.y2Values![x]
            : 0;
    final double barHeightByMaxY = widget.data.maxY > 0
        ? widget.decoration.barMaxHeight / widget.data.maxY
        : 0;

    final double yHeight = barHeightByMaxY * yValue;
    final double? y2Height = y2Value == null ? null : barHeightByMaxY * y2Value;

    return Column(
      children: [
        if (widget.data.y2Values == null &&
            widget.decoration.singleBarPosition == SingleBarWidgetPosition.top)
          _xTitle(x, showLabel),
        Expanded(
          child: _barWidget(
            x: x,
            y: yValue,
            yHeight: yHeight,
            color: widget.decoration.barDecoration.yColor ??
                Theme.of(context).primaryColor,
            position: widget.data.y2Values == null
                ? switch (widget.decoration.singleBarPosition) {
                    SingleBarWidgetPosition.top => _BarWidgetPosition.bottom,
                    SingleBarWidgetPosition.bottom => _BarWidgetPosition.top,
                  }
                : _BarWidgetPosition.top,
          ),
        ),
        if (widget.data.y2Values != null ||
            widget.decoration.singleBarPosition ==
                SingleBarWidgetPosition.bottom)
          _xTitle(x, showLabel),
        if (y2Value != null && y2Height != null)
          Expanded(
            child: _barWidget(
              x: x,
              y: y2Value,
              yHeight: y2Height,
              color: Theme.of(context).colorScheme.secondary,
              position: _BarWidgetPosition.bottom,
            ),
          ),
      ],
    );
  }

  Widget _barWidget({
    required int x,
    required double y,
    required double yHeight,
    required Color color,
    required _BarWidgetPosition position,
  }) {
    return Tooltip(
      message: "$y ($x min)",
      triggerMode: widget.decoration.tooltipDecoration.triggerMode,
      waitDuration: widget.decoration.tooltipDecoration.waitDuration,
      padding: widget.decoration.tooltipDecoration.padding,
      textStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: color,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: AnimatedSize(
        duration: const Duration(milliseconds: 300),
        child: Stack(
          children: [
            if (widget.decoration.barDecoration.showAsProgress)
              Positioned(
                top: position == _BarWidgetPosition.top ? 5 : 0,
                bottom: position == _BarWidgetPosition.bottom ? 5 : 0,
                child: Container(
                  width: widget.decoration.barDecoration.barWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: position == _BarWidgetPosition.top
                          ? const Radius.circular(14)
                          : Radius.zero,
                      topRight: position == _BarWidgetPosition.top
                          ? const Radius.circular(14)
                          : Radius.zero,
                      bottomLeft: position == _BarWidgetPosition.bottom
                          ? const Radius.circular(14)
                          : Radius.zero,
                      bottomRight: position == _BarWidgetPosition.bottom
                          ? const Radius.circular(14)
                          : Radius.zero,
                    ),
                    color: Colors.grey.withAlpha(30),
                  ),
                ),
              ),
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              child: Column(
                children: [
                  if (position == _BarWidgetPosition.top)
                    const Expanded(child: SizedBox()),
                  Container(
                    height: yHeight,
                    width: widget.decoration.barDecoration.barWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: position == _BarWidgetPosition.top
                            ? const Radius.circular(14)
                            : Radius.zero,
                        topRight: position == _BarWidgetPosition.top
                            ? const Radius.circular(14)
                            : Radius.zero,
                        bottomLeft: position == _BarWidgetPosition.bottom
                            ? const Radius.circular(14)
                            : Radius.zero,
                        bottomRight: position == _BarWidgetPosition.bottom
                            ? const Radius.circular(14)
                            : Radius.zero,
                      ),
                      color: color,
                    ),
                  ),
                  if (position == _BarWidgetPosition.bottom)
                    const Expanded(child: SizedBox()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum _BarWidgetPosition {
  top,
  bottom,
}
