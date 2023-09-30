import 'dart:collection';

import 'package:expense_new_app/Pages/Editpage.dart';
import 'package:expense_new_app/components/flashbar.dart';
import 'package:expense_new_app/currency/currencies.dart';
import 'package:expense_new_app/models/expenseitems.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class Expenselist extends StatefulWidget {
  final String title;
  final double amount;
  final DateTime dateTime;
  final Category category;
  final Currency1? selectedcurrency;
  final bool isSelected; // New property to pass isSelected status
  final VoidCallback onTap; // New property to handle tap
  final VoidCallback onLongPress; // New property to handle long press
  const Expenselist({
    super.key,
    required this.title,
    required this.amount,
    required this.dateTime,
    required this.category,
    required this.selectedcurrency,
    required this.isSelected,
    required this.onTap,
    required this.onLongPress,
  });

  @override
  State<Expenselist> createState() => _ExpenselistState();
}

class _ExpenselistState extends State<Expenselist> {
  String get formatDate {
    return formatter.format(widget.dateTime);
  }

  String formatAmount(double amount) {
    // Create a NumberFormat instance with commas
    NumberFormat formatter = NumberFormat('#,##0', 'en_US');

    // Format the amount using the formatter
    return formatter.format(amount);
  }

  HashSet<Expenseitems> selecteditems = HashSet();
  bool isselected = false;
  void domuiltipleselection(Expenseitems expenseitems) {
    if (isselected) {
      if (selecteditems.contains(expenseitems)) {
        selecteditems.remove(expenseitems);
      } else {
        selecteditems.add(expenseitems);
      }
      setState(() {});
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    String formattedAmount = formatAmount(widget.amount);
    Expenseitems expenseitems = Expenseitems(
      title: widget.title,
      amount: widget.amount,
      dateTime: widget.dateTime,
      category: widget.category,
      currency: widget.selectedcurrency,
    );

    InkWell getListItem(Expenseitems expenseitems) {
      return InkWell(
        onTap: widget.onTap,
        onLongPress: widget.onLongPress,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        "${widget.selectedcurrency?.symbol ?? ''} $formattedAmount",
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Image.asset(
                            categoryicons[widget.category]!,
                            height: 50,
                            width: 40,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            formatDate,
                          ),
                        ],
                      ),
                      Visibility(
                        visible: widget.isSelected,
                        child: Icon(
                          selecteditems.contains(expenseitems)
                              ? Icons.radio_button_unchecked
                              : Icons.check_circle,
                          size: 30,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditPage(
                    expense: expenseitems,
                  ),
                ),
              );
            },
            icon: Icons.edit,
            backgroundColor: Colors.blue,
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      ),
      child: Card(
        child: getListItem(expenseitems),
      ),
    );
  }
}
