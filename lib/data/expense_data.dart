import 'package:expense_tracker/data/hive_database.dart';
import 'package:expense_tracker/dateTime/date_time_helper.dart';
import 'package:expense_tracker/models/expense_item.dart';
import 'package:flutter/cupertino.dart';

class ExpenseData extends ChangeNotifier {
  //list of all expenses
  List<ExpenseItem> overallExpenseList = [];

  //get expense list
  List<ExpenseItem> getAllExpenseList() {
    return overallExpenseList;
  }

  //prepare data to display
  final db = HiveDataBase();

  //add new expense

  void addNewExpense(ExpenseItem newExpense) {
    overallExpenseList.add(newExpense);
    notifyListeners();
  }

  //delete expense
  void deleteExpense(ExpenseItem expense) {
    overallExpenseList.remove(expense);
    notifyListeners();
  }

  //get weekday (mon,tue,..) from a dateTime object

  String getDayName(DateTime dateTime) {
    switch (dateTime.weekday) {
      case 1:
        return "Monday";
      case 2:
        return "Tuesday";
      case 3:
        return "Wednesday";
      case 4:
        return "Thursday";
      case 5:
        return "Friday";
      case 6:
        return "Saturday";
      case 7:
        return "Sunday";
      default:
        return "";
    }
  }

  //get the date for the start of the week (sunday)
  DateTime startOfWeekDate() {
    DateTime? startOfWeek;

    //get todays date
    DateTime today = DateTime.now();

    //go backwards from today to find sunday

    for (int i = 0; i < 7; i++) {
      if (getDayName(today.subtract(Duration(days: i))) == 'Sunday') {
        startOfWeek = (today.subtract(Duration(days: i)));
      }
    }

    return startOfWeek!;
  }

/* 
Convert overall  list of expenses into a daily expense summary
eg:ExpenseList

overallExpenseList=ExpenseList[
  [ food,2023/4/6,$30],
  [drink,2023/6/5,$44],
  and so on]

->

DarilyExpenseSummery=ExpenseList[
  [2023/01/33 :$33],
  [2023/01/13 :$23],

]

*/
  Map<String, double> calculateDailyExpenseSummery() {
    Map<String, double> dailyExpenseSummery = {
      //date {yymmdd} amountTotalForDay
    };

    for (var expenese in overallExpenseList) {
      String date = convertDateTimeToString(expenese.dateTime);
      double amount = double.parse(expenese.amount);

      if (dailyExpenseSummery.containsKey(date)) {
        double currentAmount = dailyExpenseSummery[date]!;
        currentAmount += amount;
        dailyExpenseSummery[date] = currentAmount;
      } else {
        dailyExpenseSummery.addAll({date: amount});
      }
    }
    return dailyExpenseSummery;
  }
}
