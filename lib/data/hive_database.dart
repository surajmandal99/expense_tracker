import 'package:expense_tracker/models/expense_item.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDataBase {
  //reference our box
  final _myBox = Hive.box("expense_database");

  //write data
  void saveData(List<ExpenseItem> allExpense) {
    List<List<dynamic>> allExpenseFormatted = [];

    for (var expenese in allExpense) {
      List<dynamic> expenseFormatted = [
        expenese.name,
        expenese.amount,
        expenese.dateTime,
      ];

      allExpenseFormatted.add(expenseFormatted);
    }

    //lets sotre in our database
    _myBox.put("ALL_EXPENSES", allExpenseFormatted);
  }

  //read data

  List<ExpenseItem> readData() {
    List savedExpenses = _myBox.get("ALL_EXPENSES") ?? [];
    List<ExpenseItem> allExpenses = [];

    for (int i = 0; i < savedExpenses.length; i++) {
      //collect individual expense data

      String name = savedExpenses[i][0];
      String amount = savedExpenses[i][1];
      DateTime dateTime = savedExpenses[i][2];

      //create expense item

      ExpenseItem expense = ExpenseItem(
        name: name,
        amount: amount,
        dateTime: dateTime,
      );

      //add expense to overall list of expenses
      allExpenses.add(expense);
    }
    return allExpenses;
  }
}
