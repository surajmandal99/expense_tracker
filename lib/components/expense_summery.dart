import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:expense_tracker/bar_graph/bar_graph.dart';
import 'package:expense_tracker/data/expense_data.dart';
import 'package:expense_tracker/dateTime/date_time_helper.dart';

class ExpenseSummery extends StatelessWidget {
  final DateTime startOfWeek;
  const ExpenseSummery({
    Key? key,
    required this.startOfWeek,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //get yyymmmddd for each day of this week
    String sunday =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 0)));
    String monday =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 1)));
    String tuesday =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 2)));
    String wednesday =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 3)));
    String thrusday =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 4)));
    String friday =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 5)));
    String saturday =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 6)));
    return Consumer<ExpenseData>(
        builder: (context, value, child) => SizedBox(
              height: 200,
              child: MyBarGraph(
                maxY: 100,
                sunAmount: value.calculateDailyExpenseSummery()[sunday] ?? 0,
                monAmount: value.calculateDailyExpenseSummery()[monday] ?? 0,
                tueAmount: value.calculateDailyExpenseSummery()[tuesday] ?? 0,
                wedAmount: value.calculateDailyExpenseSummery()[wednesday] ?? 0,
                thurAmount: value.calculateDailyExpenseSummery()[thrusday] ?? 0,
                friAmount: value.calculateDailyExpenseSummery()[friday] ?? 0,
                satAmount: value.calculateDailyExpenseSummery()[saturday] ?? 0,
              ),
            ));
  }
}
