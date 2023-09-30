// ignore_for_file: constant_identifier_names

import 'package:expense_new_app/components/flashbar.dart';
import 'package:expense_new_app/currency/currencies.dart';
import 'package:intl/intl.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'expenseitems.g.dart';

final formatter = DateFormat.yMd();

@HiveType(typeId: 1)
enum Category {
  @HiveField(0)
  medical,
  @HiveField(1)
  communication,
  @HiveField(2)
  personal,
  @HiveField(3)
  work,
  @HiveField(4)
  utilities,
  @HiveField(5)
  groceries,
  @HiveField(6)
  others,
}
Map<Category, String> categoryicons = {
  Category.medical: "lib/icons/medical.png",
  Category.communication: "lib/icons/networking.png",
  Category.personal: "lib/icons/person.png",
  Category.work: "lib/icons/salary.png",
  Category.utilities: "lib/icons/utility.png",
  Category.groceries: "lib/icons/shopping-bag.png",
  Category.others: "lib/icons/option.png"
};

class Expenseitems {
  Expenseitems({
    required this.title,
    required this.amount,
    required this.dateTime,
    required this.category,
    required this.currency,
  });
  final String title;
  final double amount;
  final DateTime dateTime;
  final Category category;
  final Currency1? currency;
  String get formatDate {
    return formatter.format(dateTime);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Expenseitems &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          amount == other.amount &&
          dateTime == other.dateTime &&
          category == other.category &&
          currency == other.currency;

  @override
  int get hashCode =>
      title.hashCode ^
      amount.hashCode ^
      dateTime.hashCode ^
      category.hashCode ^
      currency.hashCode;
}

//? For the Chart
class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });
  //! My own alternative function:
  ExpenseBucket.forCategory(List<Expenseitems> allexpense, this.category)
      : expenses = allexpense
            .where((expense) => expense.category == category)
            .toList();

  final Category category;
  final List<Expenseitems> expenses;

  double get totalExpense {
    double sum = 0;
    //! It will go over all the data and store them in expense

    //** So the variable I define should be written in the for in to eterate and it should contain the object */

    for (final i in expenses) {
      sum += i.amount;
    }
    return sum;
  }
}
