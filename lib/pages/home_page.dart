import 'package:expense_tracker/components/expense_summery.dart';
import 'package:expense_tracker/components/expense_tile.dart';
import 'package:expense_tracker/data/expense_data.dart';
import 'package:expense_tracker/models/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//controller
  final newExpenseNameController = TextEditingController();
  final newExpenseAmountController = TextEditingController();

  //add new expense
  void addNewExpense() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Add New Expense"),
              content: Column(mainAxisSize: MainAxisSize.min, children: [
                //expense name
                TextField(
                    keyboardType: TextInputType.text,
                    controller: newExpenseNameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Expense Name")),
                //expense amount

                const SizedBox(
                  height: 5,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: newExpenseAmountController,
                  decoration: const InputDecoration(
                      hoverColor: Colors.yellow,
                      border: OutlineInputBorder(),
                      hintText: "Enter Amount"),
                ),
              ]),
              actions: [
                //save button
                MaterialButton(
                  onPressed: save,
                  child: const Text("Save"),
                ),

                //cancel button
                MaterialButton(
                  onPressed: cancel,
                  child: const Text("Cancel"),
                )
              ],
            ));
  }

  //SAVE
  void save() {
    //create expense items
    ExpenseItem newExpense = ExpenseItem(
        name: newExpenseNameController.text,
        amount: newExpenseAmountController.text,
        dateTime: DateTime.now());

    // add the new expense

    Provider.of<ExpenseData>(context, listen: false)
        .addNewExpense((newExpense));
    Navigator.pop(context);
//clear controllers
    clear();
  }

  //CANCEL
  void cancel() {
    Navigator.pop(context);
    clear();
  }

  //clear controller after adding the item and price
  void clear() {
    newExpenseAmountController.clear();
    newExpenseAmountController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
        builder: ((context, value, child) => Scaffold(
            backgroundColor: Colors.grey[300],
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.black,
              onPressed: addNewExpense,
              child: const Icon(Icons.add),
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: ListView(
                children: [
                  //weekly summery
                  ExpenseSummery(startOfWeek: value.startOfWeekDate()),
                  const SizedBox(
                    height: 20,
                  ),
                  //expense list
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: value.getAllExpenseList().length,
                    itemBuilder: (context, index) => ExpenseTile(
                      name: value.getAllExpenseList()[index].name,
                      amount: value.getAllExpenseList()[index].amount,
                      dateTime: value.getAllExpenseList()[index].dateTime,
                    ),
                  )
                ],
              ),
            ))));
  }
}
