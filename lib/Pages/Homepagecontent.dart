import 'dart:collection';
import 'dart:convert';
import 'package:expense_new_app/Database/hive_db.dart';
import 'package:expense_new_app/Pages/flagpage.dart';
import 'package:expense_new_app/chart/chart.dart';
import 'package:expense_new_app/components/expenselist.dart';
import 'package:expense_new_app/components/flashbar.dart';
import 'package:expense_new_app/currency/currencies.dart';
import 'package:expense_new_app/models/expense_data.dart';
import 'package:expense_new_app/models/expenseitems.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:pattern_formatter/numeric_formatter.dart';
import 'package:provider/provider.dart';

class Homepagecontent extends StatefulWidget {
  const Homepagecontent({super.key});

  @override
  State<Homepagecontent> createState() => _HomepagecontentState();
}

class _HomepagecontentState extends State<Homepagecontent> {
  DateTime? _selectedDate;
  Category _category = Category.medical;
  List<Currency1> currencies = [];
  Currency1? currencyselected;
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  void _loadCurrencyData() async {
    final jsondata = await rootBundle.rootBundle
        .loadString('lib/currencyjsonfile/currency.json');
    final list = json.decode(jsondata) as List<dynamic>;
    setState(() {
      currencies = list.map((e) => Currency1.fromJson(e)).toList();
    });
  }

  void addnewexpense1() {
    showModalBottomSheet(
      isScrollControlled: true, //? to take the full screen
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (context, setState) => Padding(
          padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                maxLength: 50,
                decoration: InputDecoration(
                  label: const Text('Description'),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 92, 40, 236)),
                  ),
                ),
              ),
              const SizedBox(),
              FlagPage(
                onCurrencySelected: (currency) {
                  setState(() {
                    currencyselected = currency;
                  });
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
                        prefix: Text(
                            "${currencyselected?.symbol.toString() ?? ''}  "),
                        label: const Text('Amount'),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 92, 40, 236)),
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
                          _selectedDate == null
                              ? 'No date selected'
                              : formatter.format(_selectedDate!),
                        ),
                        IconButton(
                          onPressed: () async {
                            final now = DateTime.now();
                            final firstdate =
                                DateTime(now.year - 1, now.month, now.day);
                            final pickedDate = await showDatePicker(
                              context: context,
                              initialDate: now,
                              firstDate: firstdate,
                              lastDate: now,
                            );
                            setState(() {
                              _selectedDate = pickedDate;
                            });
                          },
                          icon: const Icon(Icons.date_range),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  DropdownButton(
                    value: _category,
                    items: Category.values
                        .map(
                          (category) => DropdownMenuItem(
                            value: category,
                            child: Text(
                              category.name,
                            ),
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
                      Navigator.pop(context);
                      clear();
                      resetCategoryAndDate();
                    },
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final enteredamount = double.tryParse(
                          _amountController.text.replaceAll(',',
                              '')); // used to turn into double when entering tryParse('Hello') => null, tryParse('1.12) => 1.12
                      final amountInvalid =
                          enteredamount == null || enteredamount <= 0;
                      if (_titleController.text.trim().isEmpty ||
                          amountInvalid ||
                          _selectedDate == null) {
                        // show error message
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: const Text('Invalid input'),
                            content: const Text(
                                'Please make sure a valid title, amount,date'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(ctx);
                                },
                                child: const Text('Okay'),
                              ),
                            ],
                          ),
                        );
                        return;
                      }
                      Expenseitems expenseitem = Expenseitems(
                        title: _titleController.text,
                        amount: enteredamount,
                        dateTime: _selectedDate!,
                        category: _category,
                        currency: currencyselected,
                      );
                      Provider.of<ExpenseData>(context, listen: false)
                          .addnewexpense(expenseitem);
                      Navigator.pop(context);
                      clear();
                      resetCategoryAndDate();
                    },
                    child: const Text('Save Expense'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void clear() {
    _titleController.clear();
    _amountController.clear();
  }

  void resetCategoryAndDate() {
    setState(() {
      _selectedDate = null;
      _category = Category.medical;
    });
  }

  //? delete expense
  void delete(Expenseitems expensedelete) {
    Provider.of<ExpenseData>(context, listen: false)
        .deleteexpense(expensedelete);
  }

  @override
  void initState() {
    super.initState();
    Provider.of<ExpenseData>(context, listen: false).preparedata();
    _loadCurrencyData();
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
    Widget maincontent = const Center(
      child: Text(
        'No expenses are found. Start tracking your expense',
      ),
    );
    return Consumer<ExpenseData>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Expense Tracker Plus'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: addnewexpense1,
          child: const Icon(Icons.add),
        ),
        body: ListView(
          children: [
            // Chart(expenses: value.allexpense),
            maincontent,
            ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: value.getexpense().length,
              itemBuilder: (context, index) => Expenselist(
                title: value.getexpense()[index].title,
                amount: value.getexpense()[index].amount,
                dateTime: value.getexpense()[index].dateTime,
                category: value.getexpense()[index].category,
                selectedcurrency: value.getexpense()[index].currency,
                isSelected: selecteditems.contains(value.getexpense()[index]),
                onTap: () {
                  domuiltipleselection(value.getexpense()[index]);
                },
                onLongPress: () {
                  isselected = true;
                  domuiltipleselection(value.getexpense()[index]);
                },
              ),
            ),
            selecteditems.isNotEmpty
                ? ElevatedButton(
                    onPressed: () {
                      // Implement deletion logic here
                      if (selecteditems.isNotEmpty) {
                        // Create a copy of the selected items to use for undo
                        final List<Expenseitems> deletedItems =
                            List.from(selecteditems);
                        // Loop through the selecteditems set and delete each expense item
                        for (var selectedExpense in selecteditems) {
                          delete(selectedExpense);
                        }

                        // Clear the selecteditems set and reset isselected flag
                        selecteditems.clear();
                        isselected = false;

                        // Force a UI update by calling setState
                        setState(() {});

                        // Show an undo message
                        FlushBars.undo(
                          message: "You still have a chance to undo it!",
                          onUndo: () {
                            // Undo the deletion by adding the deleted items back
                            for (var expense in deletedItems) {
                              value.getexpense().add(expense);
                            }
                            Hivedb hivedb = Hivedb();
                            hivedb.saveData(deletedItems);
                            // Force a UI update by calling setState
                            setState(() {});
                            Navigator.pop(context);
                          },
                          duration: const Duration(seconds: 6),
                        ).show(context);
                      }
                    },
                    child: Text("Delete ${selecteditems.length}"),
                  )
                : const Text(""),
          ],
        ),
      ),
    );
  }
}
