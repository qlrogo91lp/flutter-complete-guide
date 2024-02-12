import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartExample extends StatelessWidget {
  const PieChartExample({super.key});

  @override
  Widget build(BuildContext context) {
    List<PieChartSectionData> showingSections() {
      return List.generate(5, (i) {
        const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
        switch (i) {
          case 0:
            return PieChartSectionData(
              color: Colors.blue,
              value: 55,
              title: '55%',
              radius: 50,
              titleStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: shadows,
              ),
            );
          case 1:
            return PieChartSectionData(
              color: Colors.orange,
              value: 21,
              title: '21%',
              radius: 50,
              titleStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: shadows,
              ),
            );
          case 2:
            return PieChartSectionData(
              color: Colors.grey,
              value: 9,
              title: '9%',
              radius: 50,
              titleStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: shadows,
              ),
            );
          case 3:
            return PieChartSectionData(
              color: Colors.amber,
              value: 8,
              title: '8%',
              radius: 50,
              titleStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: shadows,
              ),
            );
          case 4:
            return PieChartSectionData(
              color: Colors.blue[50],
              value: 7,
              title: '7%',
              radius: 50,
              titleStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: shadows,
              ),
            );
          default:
            throw Error();
        }
      });
    }

    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        margin: const EdgeInsets.symmetric(vertical: 20),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: const Color(0xfff9f9f9),
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(3)),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height * 0.25,
              child: PieChart(
                PieChartData(
                  sections: showingSections(),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 10),
              child: const Text('[전체 응시자 정답률]'),
            ),
            SizedBox(
              width: double.infinity,
              child: DefaultTextStyle(
                style: const TextStyle(fontSize: 11, color: Colors.black),
                child: Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  children: List.generate(8, (index) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          child: SizedBox.square(
                            dimension: 9,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  color: Colors.blue[(index + 1) * 100]),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          child: Text('${(index + 1) * (index + 1)}번'),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
