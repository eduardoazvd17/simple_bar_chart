# 📊 Simple Bar Chart

**Simple Bar Chart** is a lightweight and customizable Flutter library for creating simple bar charts. Ideal for visually comparing data in an elegant and minimalistic way.

## 🌟 Features

- **Flexible Configuration**: Customize titles, colors, and tooltips.
- **Support for Two Data Series**: Display charts with one or two Y-axis data series.
- **Customizable Tooltip**: Format and style tooltips to show contextual information.
- **Responsive Design**: Adjust chart height and layout for different screen sizes.
- **Horizontal Scroll**: The chart will auto enable scrollview on horizontal axis to fit all data.

## 🚀 Installation

Add `simple_bar_chart` to your `pubspec.yaml`:

```yaml
dependencies:
  simple_bar_chart: ^1.0.0
```

## 🛠️ Usage

### Basic Example
Import **simple_bar_chart** into your dart file:
```dart
import 'package:simple_bar_chart/simple_bar_chart.dart';
```

Create a **SimpleBarChartWidget** instance:
```dart
SimpleBarChartWidget(
    data: SimpleBarChartData(
        xValues: List.generate(100, (index) => index),
        yValues: List.generate(
            100, (index) => Random().nextDouble() * 256),
    ),
),
```

Control the overall layout of the chart, including height, titles, bars, and tooltips:
```dart
SimpleBarChartWidget(
    decoration: SimpleBarChartDecoration(
        height: 300.0, 
        showScrollbar: true, 
        singleBarPosition: SingleBarWidgetPosition.bottom, // Default value
        titleDecoration: SimpleBarChartTitleDecoration(
            xHeightSpace: 40.0,
            xWidthSpace: 35.0,
            showYTitles: true,
            yTitleTextFormatter: null,
            fixedYTitles: false,
            yTitlePosition: YTitlePosition.both,
        ),
        tooltipDecoration: SimpleBarChartTooltipDecoration(
            backgroundColor: null,
            triggerMode: TooltipTriggerMode.tap,
            waitDuration: Duration.zero,
            padding: EdgeInsets.all(15.0),
            yTextFormatter: null,
            y2TextFormatter: null,
        ),
        barDecoration: SimpleBarChartBarDecoration(
            barWidth: 15.0,
            showAsProgress: true,
            yColor: null,
            y2Color: null,
        ),
    ),
    data: SimpleBarChartData(
        xValues: List.generate(100, (index) => index),
        yValues: List.generate(
            100, (index) => Random().nextDouble() * 256),
    ),
),
```