import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expense_new_app/currency/currencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;

class FlagPage extends StatefulWidget {
  final Function(Currency1?) onCurrencySelected;
  const FlagPage({Key? key, required this.onCurrencySelected})
      : super(key: key);

  @override
  _FlagPageState createState() => _FlagPageState();
}

class _FlagPageState extends State<FlagPage> {
  List<Currency1> currencies = [];
  TextEditingController _searchController = TextEditingController();
  List<Currency1> _suggestedCurrencies = [];

  @override
  void initState() {
    super.initState();
    _loadCurrencyData();
  }

  void _loadCurrencyData() async {
    final jsondata = await rootBundle.rootBundle
        .loadString('lib/currencyjsonfile/currency.json');
    final list = json.decode(jsondata) as List<dynamic>;
    setState(() {
      currencies = list.map((e) => Currency1.fromJson(e)).toList();
    });
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _suggestedCurrencies = currencies
          .where((currency) =>
              currency.name.toLowerCase().contains(query) ||
              currency.symbol.toLowerCase().contains(query))
          .toList();
    });
  }

  void _showCurrencyDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            final filteredCurrencies = currencies
                .where((currency) =>
                    currency.name
                        .toLowerCase()
                        .contains(_searchController.text.toLowerCase()) ||
                    currency.symbol
                        .toLowerCase()
                        .contains(_searchController.text.toLowerCase()))
                .toList();
            return AlertDialog(
              title: TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  labelText: 'Search Currency',
                ),
                onChanged: (value) {
                  setState(
                      () {}); // Trigger a rebuild to update the filtered list
                },
              ),
              content: SizedBox(
                width: double.maxFinite,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: filteredCurrencies.length,
                  itemBuilder: (context, index) {
                    final currency = filteredCurrencies[index];
                    return ListTile(
                      onTap: () {
                        _searchController.text = currency.code;
                        Navigator.pop(context); // Close the dialog
                        widget.onCurrencySelected(currency);
                      },
                      leading: CachedNetworkImage(
                        imageUrl: currency.flag,
                        width: 40,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                      title: Text(currency.code.toString()),
                      subtitle: Text(currency.name.toString()),
                      trailing: Text(
                        currency.symbol,
                        style: const TextStyle(fontSize: 20),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: _showCurrencyDialog,
          child: TextField(
            controller: _searchController,
            decoration: const InputDecoration(
              labelText: 'Search Currency',
            ),
            onTap:
                _showCurrencyDialog, // Show the dialog when tapping the TextField
          ),
        ),
      ],
    );
  }
}
