import 'package:expense_tracker/bar_graph/bar_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyBarGraph extends StatelessWidget {
  final double? maxY;
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thurAmount;
  final double friAmount;
  final double satAmount;

  const MyBarGraph({
    Key? key,
    this.maxY,
    required this.sunAmount,
    required this.monAmount,
    required this.tueAmount,
    required this.wedAmount,
    required this.thurAmount,
    required this.friAmount,
    required this.satAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //initilize the bar data
    BarData myBarData = BarData(
        sunAmount: sunAmount,
        monAmount: monAmount,
        tueAmount: tueAmount,
        wedAmount: wedAmount,
        thurAmount: thurAmount,
        friAmount: friAmount,
        satAmount: satAmount);
    myBarData.initilizeBarData();

    return BarChart(
      BarChartData(
          maxY: 100,
          minY: 0,
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
              show: true,
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles:
                  AxisTitles(sideTitles: SideTitles(showTitles: false)),
              bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                      showTitles: true, getTitlesWidget: getBottomTiles))),
          borderData: FlBorderData(show: false),
          barGroups: myBarData.barData
              .map((data) => BarChartGroupData(
                    x: data.x,
                    barRods: [
                      BarChartRodData(
                          toY: data.y,
                          color: Colors.yellowAccent,
                          width: 24,
                          borderRadius: BorderRadius.circular(5),
                          backDrawRodData: BackgroundBarChartRodData(
                              show: true, toY: maxY, color: Colors.black))
                    ],
                  ))
              .toList()),
    );
  }
}

Widget getBottomTiles(double value, TitleMeta meta) {
  const style =
      TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 15);

  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text(
        "S",
        style: style,
      );
      break;
    case 1:
      text = const Text(
        "M",
        style: style,
      );
      break;
    case 2:
      text = const Text(
        "T",
        style: style,
      );
      break;
    case 3:
      text = const Text(
        "W",
        style: style,
      );
      break;
    case 4:
      text = const Text(
        "T",
        style: style,
      );
      break;
    case 5:
      text = const Text(
        "F",
        style: style,
      );
      break;
    case 6:
      text = const Text(
        "S",
        style: style,
      );
      break;
    default:
      text = const Text(
        "",
        style: style,
      );
      break;
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: text,
  );
}
