// // ignore_for_file: file_names

import 'package:expense_new_app/Pages/Homepagecontent.dart';
import 'package:expense_new_app/Pages/flagpage.dart';
import 'package:expense_new_app/currency/currencies.dart';
import 'package:flutter/material.dart';
import 'package:expense_new_app/models/expense_data.dart';
import 'package:intl/intl.dart';
import 'package:pattern_formatter/numeric_formatter.dart';
import 'package:provider/provider.dart';

import '../models/expenseitems.dart';

class EditPage extends StatefulWidget {
  final Expenseitems? expense;

  const EditPage({super.key, this.expense});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  late DateTime _selectedDate;
  late Category _category;
  late Currency1? currencyselected;
  late bool undodelete;
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  @override
  void initState() {
    super.initState();
    if (widget.expense != null) {
      _titleController.text = widget.expense!.title;
      _amountController.text = widget.expense!.amount.toString();
      _selectedDate = widget.expense!.dateTime;
      _category = widget.expense!.category;
      currencyselected = widget.expense!.currency;
    } else {
      _selectedDate = DateTime.now();
      _category = Category.medical;
      currencyselected = Currency1(symbol: '', code: '', name: '', flag: '');
    }
  }

  // Method to update selected currency
  void updateSelectedCurrency(Currency1 currency) {
    setState(() {
      currencyselected = currency;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Expense'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              maxLength: 50,
              decoration: InputDecoration(
                labelText: 'Description',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 92, 40, 236),
                  ),
                ),
              ),
            ),
            const SizedBox(),
            FlagPage(
              onCurrencySelected: (currency) {
                updateSelectedCurrency(currency!);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      ThousandsFormatter(),
                    ],
                    decoration: InputDecoration(
                      prefix:
                          Text("${currencyselected?.symbol.toString() ?? ''} "),
                      labelText: 'Amount',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 92, 40, 236),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                   Text(
                          DateFormat.yMMMMd().format(_selectedDate),
                        ),
                      Expanded(
                        child: IconButton(
                          onPressed: () async {
                            final now = DateTime.now();
                            final firstdate =
                                DateTime(now.year - 1, now.month, now.day);
                            final pickedDate = await showDatePicker(
                              context: context,
                              initialDate: _selectedDate,
                              firstDate: firstdate,
                              lastDate: now,
                            );
                            if (pickedDate != null) {
                              setState(() {
                                _selectedDate = pickedDate;
                              });
                            }
                          },
                          icon: const Icon(Icons.date_range),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                DropdownButton(
                  value: _category,
                  items: Category.values
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(category.name),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(
                      () {
                        _category = value;
                      },
                    );
                  },
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Homepagecontent()),
                    );
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final enteredAmount = double.tryParse(
                        _amountController.text.replaceAll(',', ''));

                    if (_titleController.text.trim().isEmpty ||
                        enteredAmount == null ||
                        enteredAmount <= 0) {
                      // Show error dialog if necessary
                      return;
                    }

                    Expenseitems editedExpense = Expenseitems(
                      title: _titleController.text,
                      amount: enteredAmount,
                      dateTime: _selectedDate,
                      category: _category,
                      currency: currencyselected,
                    );

                    if (widget.expense != null) {
                      // Update existing expense
                      Provider.of<ExpenseData>(context, listen: false)
                          .updateExpense(widget.expense!, editedExpense);
                    } else {
                      // Add new expense
                      Provider.of<ExpenseData>(context, listen: false)
                          .addnewexpense(editedExpense);
                    }

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Homepagecontent()),
                    );
                  },
                  child: const Text('Save Expense'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
