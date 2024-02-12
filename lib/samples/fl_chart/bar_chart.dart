import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_complete_guide/samples/fl_chart/legend_widget.dart';

class _BarData {
  const _BarData(this.color, this.value, this.shadowValue);
  final Color color;
  final double value;
  final double shadowValue;
}

class BarChartExample extends StatelessWidget {
  BarChartExample({super.key});

  final shadowColor = const Color(0xFFCCCCCC);
  final dataList = [
    const _BarData(Colors.red, 90, 80),
    const _BarData(Colors.red, 86, 76),
    const _BarData(Colors.red, 70, 60),
    const _BarData(Colors.red, 60, 66),
  ];
  final List<String> titles = ['계산력', '이해력', '추론력', '문제해결능력'];

  // 바 데이터
  BarChartGroupData generateBarGroup(
    int x,
    Color color,
    double value,
    double shadowValue,
  ) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: value,
          color: color,
          width: 10,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(5)),
        ),
        BarChartRodData(
          toY: shadowValue,
          color: shadowColor,
          width: 10,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(5)),
        ),
      ],
      // showingTooltipIndicators: touchedGroupIndex == x ? [0] : [],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          LegendsListWidget(legends: [
            Legend('나의 평가항목', Colors.red),
            Legend('전체응시자 평가항목', Colors.grey),
          ]),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 20, 15, 20),
            color: const Color(0xffededed).withOpacity(0.5),
            height: MediaQuery.of(context).size.height * 0.3,
            child: RotatedBox(
              quarterTurns: 1,
              child: BarChart(
                BarChartData(
                  minY: 0,
                  maxY: 100,
                  alignment: BarChartAlignment.spaceEvenly,
                  borderData: FlBorderData(
                    show: true,
                    border: Border(
                        top: BorderSide(color: Colors.grey.withOpacity(0.2)),
                        bottom:
                            const BorderSide(color: Colors.black, width: 2)),
                  ),
                  titlesData: FlTitlesData(
                      show: true,
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 90,
                          getTitlesWidget: (value, meta) {
                            final index = value.toInt();
                            return SideTitleWidget(
                              axisSide: meta.axisSide,
                              child: RotatedBox(
                                quarterTurns: -1,
                                child: Text(titles[index]),
                              ),
                            );
                          },
                        ),
                      ),
                      rightTitles: AxisTitles(
                        drawBelowEverything: true,
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 30,
                          getTitlesWidget: (value, meta) {
                            return RotatedBox(
                              quarterTurns: -1,
                              child: Text(
                                value.toInt().toString(),
                                textAlign: TextAlign.left,
                              ),
                            );
                          },
                        ),
                      ),
                      topTitles: const AxisTitles(),
                      leftTitles: const AxisTitles()),
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    getDrawingHorizontalLine: (value) => FlLine(
                      color: Colors.grey.withOpacity(0.2),
                      strokeWidth: 1,
                    ),
                  ),
                  barGroups: dataList.asMap().entries.map((e) {
                    final index = e.key;
                    final data = e.value;
                    return generateBarGroup(
                      index,
                      data.color,
                      data.value,
                      data.shadowValue,
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}