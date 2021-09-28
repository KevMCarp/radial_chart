import 'dart:math';

import 'package:flutter/material.dart';
import 'package:radial_chart/radial_chart.dart';

import 'indicator.dart';

class RadialChartSample2 extends StatefulWidget {
  const RadialChartSample2({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => RadialChart2State();
}

class RadialChart2State extends State {
  int touchedIndex = -1;
  var _values = <double>[];

  @override
  void initState() {
    super.initState();
    buildWidget();
  }

  void buildWidget() async {
    final random = Random.secure();

    while (true) {
      final random1 = random.nextInt(400).toDouble();
      final random2 = random.nextInt(300).toDouble();
      final random3 = random.nextInt(150).toDouble();

      setState(() {
        _values = [random1, random2, random3, random3];
      });

      await Future<void>.delayed(const Duration(seconds: 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Row(
        children: <Widget>[
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: RadialChart(
                RadialChartData(
                    showSectionsSpace: true,
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 0,
                    sections: [
                      RadialChartSectionData(
                        color: const Color(0xff0293ee),
                        value: _values[0],
                        showTitle: false,
                      ),
                      RadialChartSectionData(
                        color: const Color(0xfff8b250),
                        value: _values[1],
                        showTitle: false,
                      ),
                      RadialChartSectionData(
                        color: const Color(0xff845bef),
                        value: _values[2],
                        showTitle: false,
                      ),
                      RadialChartSectionData(
                        color: const Color(0xff13d38e),
                        value: _values[3],
                        showTitle: false,
                      ),
                    ]),
              ),
            ),
          ),
          Expanded(
            child: Column(
              // mainAxisSize: MainAxisSize.max,
              // mainAxisAlignment: MainAxisAlignment.end,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Indicator(
                  color: const Color(0xff0293ee),
                  text: '${_values[0]}',
                  isSquare: true,
                ),
                const SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: const Color(0xfff8b250),
                  text: '${_values[1]}',
                  isSquare: true,
                ),
                const SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: const Color(0xff845bef),
                  text: '${_values[2]}',
                  isSquare: true,
                ),
                const SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: const Color(0xff13d38e),
                  text: '${_values[3]}',
                  isSquare: true,
                ),
                const SizedBox(
                  height: 18,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 28,
          ),
        ],
      ),
    );
  }
}
