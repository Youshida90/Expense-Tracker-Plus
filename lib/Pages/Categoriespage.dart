// ignore_for_file: file_names

import 'package:expense_new_app/models/Categoryitems.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final _namecontroller = TextEditingController();
  void clear() {
    _namecontroller.clear();
  }

  // void resetCategoryAndDate() {
  //   setState(() {
  //     _selectedDate = null;
  //     _category = Category.medical;
  //     _currencyselected = Currency.USD;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker Plus'),
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => StatefulBuilder(
                        builder: (context, setState) => AlertDialog(
                          title: const Text("Add A New Category"),
                          content: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    TextButton(
                                      onPressed: () {},
                                      child: const Text("Expense"),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: const Text("Income"),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: const Text("Saving"),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                TextField(
                                  controller: _namecontroller,
                                  maxLength: 50,
                                  decoration: InputDecoration(
                                    label: const Text('Name'),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: const BorderSide(
                                          color:
                                              Color.fromARGB(255, 92, 40, 236)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                clear();
                                // resetCategoryAndDate();
                              },
                              child: const Text('Cancel'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (_namecontroller.text.trim().isEmpty) {
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
                                Categoryitems cat =
                                    Categoryitems(name: _namecontroller.text);
                                Navigator.pop(context);
                                clear();
                                // resetCategoryAndDate();
                              },
                              child: const Text('Save Expense'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: const Text("Add New Category"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
