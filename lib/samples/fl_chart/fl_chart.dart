import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/samples/fl_chart/bar_chart.dart';
import 'package:flutter_complete_guide/samples/fl_chart/pie_chart.dart';
import 'package:flutter_complete_guide/samples/fl_chart/radar_chart.dart';

void main() {
  runApp(const FLChartExample());
}

class FLChartExample extends StatefulWidget {
  const FLChartExample({super.key});

  @override
  State<StatefulWidget> createState() => _FlChartExampleState();
}

class _FlChartExampleState extends State<FLChartExample> {
  List<Widget> widgets = [
    BarChartExample(),
    RadarChartExample(),
    PieChartExample(),
  ];

  Widget currentWidget = BarChartExample();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: Scaffold(
          body: Column(
        children: [
          currentWidget,
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () {
                  setState(() => currentWidget = BarChartExample());
                }, child: Text('Bar Chart')),
                ElevatedButton(onPressed: () {
                  setState(() => currentWidget = RadarChartExample());
                }, child: Text('Radar Chart')),
                ElevatedButton(onPressed: () {
                  setState(() => currentWidget = PieChartExample());
                }, child: Text('Pie Chart')),
              ],
            ),
          )
        ],
      )),
    );
  }
}
