import 'package:expense_new_app/models/expenseitems.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Hivedb {
  // Reference to our Box
  final _myBox = Hive.box("expense_db");
  
  // Reading data
  List<Expenseitems> readData() {
    List<dynamic> savedExpenses = _myBox.get("ALL_EXPENSES") ?? [];
    List<Expenseitems> allExpenses = [];
    for (var i = 0; i < savedExpenses.length; i++) {
        String name = savedExpenses[i][0];
        double amount = savedExpenses[i][1];
        DateTime dateTime = savedExpenses[i][2];
        Category category = savedExpenses[i][3];
        Currency currency = savedExpenses[i][4];
        Expenseitems expense = Expenseitems(
        title: name,
        amount: amount,
        dateTime: dateTime,
        category: category,
        currency: currency,
      );
        allExpenses.add(expense); // Add the created ExpenseItem to the list
    }
    return allExpenses;
  }

  // Write data
  void saveData(List<Expenseitems> allExpense) {
    List<dynamic> allExpenseformatted = [];
    for (var expense in allExpense) {
      List<dynamic> expenseFormatted = [
        expense.title,
        expense.amount,
        expense.dateTime,
        expense.category,
        expense.currency,
      ];
      allExpenseformatted.add(expenseFormatted);
    }
    _myBox.put("ALL_EXPENSES", allExpenseformatted);
  }
}
