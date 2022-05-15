import 'package:flutter/material.dart';

import 'samples/radial_chart_sample2.dart';

class RadialChartPage extends StatelessWidget {
  const RadialChartPage({super.key});

  final Color barColor = Colors.white;
  final Color barBackgroundColor = const Color(0xff72d8bf);
  final double width = 22;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffeceaeb),
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: ListView(
          children: const <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  'Radial Chart',
                  style: TextStyle(
                      color: Color(
                        0xff333333,
                      ),
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            RadialChartSample2(),
          ],
        ),
      ),
    );
  }
}
