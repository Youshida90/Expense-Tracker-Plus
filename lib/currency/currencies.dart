import 'package:hive/hive.dart';
part 'currencies.g.dart';


@HiveType(typeId: 2)
class Currency1 {
    @HiveField(0)
  final String code;
   @HiveField(1)
   final String name;
    @HiveField(2)
  final String flag;
    @HiveField(3)
  final String symbol;

  Currency1({
    required this.code,
    required this.name,
    required this.flag,
    required this.symbol,
  });

  factory Currency1.fromJson(Map<String, dynamic> json) {
    return Currency1(
      code: json['code'],
      name: json['name'],
      flag: json['flag'],
      symbol: json['symbol'],
    );
  }
}