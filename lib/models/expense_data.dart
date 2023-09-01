// ignore_for_file: file_names

import 'package:expense_new_app/Database/hive_db.dart';
import 'package:expense_new_app/models/expenseitems.dart';
import 'package:flutter/material.dart';

class ExpenseData extends ChangeNotifier {

  //? List of all expense

  List<Expenseitems> allexpense = [];

  //? get expense List

  List<Expenseitems> getexpense() {
    return allexpense;
  }


  //prepare data
final db = Hivedb();
  void preparedata(){
    if(db.readData().isNotEmpty){
      allexpense = db.readData();
    }
  }

  //! add a new expense

  void addnewexpense(Expenseitems newexpense) {
    allexpense.add(newexpense);
    notifyListeners();
    db.saveData(allexpense);
  }

  //! delete expense

  void deleteexpense(Expenseitems deleteexpense) {
    allexpense.remove(deleteexpense);
    notifyListeners();
    db.saveData(allexpense);
  }

   void updateExpense(Expenseitems oldExpense, Expenseitems newExpense) {
    final index = allexpense.indexOf(oldExpense);
    if (index != -1) {
      allexpense[index] = newExpense;
      notifyListeners();
      db.saveData(allexpense);
    }
  }
}
