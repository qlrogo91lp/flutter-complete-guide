import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/samples/fl_chart/legend_widget.dart';

class RadarChartExample extends StatelessWidget {
  const RadarChartExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          LegendsListWidget(legends: [
            Legend('나의 평가항목', Colors.red),
            Legend('전체응시자 평가항목', Colors.grey),
          ]),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            height: MediaQuery.of(context).size.height * 0.3,
            child: RadarChart(
              RadarChartData(
                radarShape: RadarShape.polygon,
                tickCount: 3,
                ticksTextStyle: const TextStyle(color: Colors.black, fontSize: 11),
                radarBorderData: const BorderSide(color: Colors.grey, width: 1),
                tickBorderData: const BorderSide(color: Colors.grey, width: 1),
                gridBorderData: const BorderSide(color: Colors.grey, width: 1),
                titlePositionPercentageOffset: 0.1,
                getTitle: (index, angle) {
                  switch (index) {
                    case 0:
                      return RadarChartTitle(text: '최상');
                    case 1:
                      return RadarChartTitle(text: '상');
                    case 2:
                      return RadarChartTitle(text: '중상');
                    case 3:
                      return RadarChartTitle(text: '중');
                    case 4:
                      return RadarChartTitle(text: '중하');
                    case 5:
                      return RadarChartTitle(text: '하');
                    default:
                      return const RadarChartTitle(text: '');
                  }
                },
                dataSets: [
                  RadarDataSet(
                    entryRadius: 0,
                    borderWidth: 3,
                    borderColor: Colors.red,
                    fillColor: Colors.red.withOpacity(0.0),
                    dataEntries: [
                      RadarEntry(
                        value: 10,
                      ),
                      RadarEntry(
                        value: 30,
                      ),
                      RadarEntry(
                        value: 50,
                      ),
                      RadarEntry(
                        value: 40,
                      ),
                      RadarEntry(
                        value: 20,
                      ),
                      RadarEntry(
                        value: 70,
                      ),
                    ],
                  ),
                  RadarDataSet(
                    entryRadius: 0,
                    borderWidth: 3,
                    borderColor: Colors.grey,
                    fillColor: Colors.grey.withOpacity(0.0),
                    dataEntries: [
                      RadarEntry(
                        value: 30,
                      ),
                      RadarEntry(
                        value: 45,
                      ),
                      RadarEntry(
                        value: 55,
                      ),
                      RadarEntry(
                        value: 33,
                      ),
                      RadarEntry(
                        value: 22,
                      ),
                      RadarEntry(
                        value: 11,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
