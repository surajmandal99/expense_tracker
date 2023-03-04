// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expense_tracker/bar_graph/individual_bar.dart';

class BarData {
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thurAmount;
  final double friAmount;
  final double satAmount;

  BarData({
    required this.sunAmount,
    required this.monAmount,
    required this.tueAmount,
    required this.wedAmount,
    required this.thurAmount,
    required this.friAmount,
    required this.satAmount,
  });

  List<IndividualBar> barData = [];

  //initilize bar data
  void initilizeBarData() {
    barData = [
      //Sun
      IndividualBar(x: 0, y: sunAmount),

      //Mon
      IndividualBar(x: 1, y: monAmount),

      //Tue
      IndividualBar(x: 2, y: tueAmount),

      //Wed
      IndividualBar(x: 3, y: wedAmount),

      //Thur
      IndividualBar(x: 4, y: thurAmount),

      //Fri
      IndividualBar(x: 5, y: friAmount),

      //Sat
      IndividualBar(x: 6, y: satAmount),
    ];
  }
}
