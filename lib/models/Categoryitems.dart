// ignore_for_file: file_names
import 'package:hive/hive.dart';

@HiveType(typeId: 1)
enum SavingCategory {
  @HiveField(0)
  emergencyfund,
  @HiveField(1)
  vacation,
  @HiveField(2)
  retirement,
  @HiveField(3)
  investments,
  @HiveField(4)
  healthcare,
  @HiveField(5)
  electronicsupgrade,
  @HiveField(6)
  others,
}


@HiveType(typeId: 2)
enum IncomeCategory {
  @HiveField(0)
  salary,
  @HiveField(1)
  rental,
  @HiveField(2)
  refunds,
  @HiveField(3)
  investments,
  @HiveField(4)
  lottery,
}


class Categoryitems {
  final String name;

  Categoryitems({
    required this.name,
  });
}
