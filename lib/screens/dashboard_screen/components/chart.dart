import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class Chart extends StatelessWidget {
  const Chart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(children: [
        PieChart(
          PieChartData(
              startDegreeOffset: -90,
              centerSpaceRadius: 70,
              sectionsSpace: 0,
              sections: sectionsList),
        ),
        Positioned.fill(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: defualtPadding,
            ),
            Text(
              '29.1',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                  color: Colors.white, height: .5, fontWeight: FontWeight.w600),
            ),
            Text('of 128GB')
          ],
        ))
      ]),
    );
  }
}

List<PieChartSectionData> sectionsList = [
  PieChartSectionData(
      radius: 25, value: 100, color: primaryColor, showTitle: false),
  PieChartSectionData(
      radius: 22, value: 100, color: Colors.cyan, showTitle: false),
  PieChartSectionData(
      radius: 19, value: 100, color: Colors.yellow, showTitle: false),
  PieChartSectionData(
      radius: 16, value: 100, color: Colors.red, showTitle: false),
  PieChartSectionData(
      radius: 13,
      value: 100,
      color: primaryColor.withOpacity(.1),
      showTitle: false),
];
