import 'dart:math';

import 'package:flutter/material.dart';
import 'package:slider_bar_chart/slider_bar_chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Bar Chart Example',
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(title: const Text('Simple Bar Chart Example')),
        body: Center(
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('With single y values'),
                  SliderBarChartWidget(
                    data: SbcData(
                      xValues: List.generate(100, (index) => index),
                      yValues: List.generate(
                          100, (index) => Random().nextDouble() * 256),
                    ),
                  ),
                  const Divider(height: 100),
                  const Text('With double y values'),
                  SliderBarChartWidget(
                    data: SbcData(
                      xValues: List.generate(100, (index) => index),
                      yValues: List.generate(
                          100, (index) => Random().nextDouble() * 256),
                      y2Values: List.generate(
                          100, (index) => Random().nextDouble() * 256),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
