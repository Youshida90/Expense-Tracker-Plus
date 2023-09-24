// ignore_for_file: constant_identifier_names

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

@HiveType(typeId: 2)
enum Currency {
  @HiveField(0)
  AFN,
  @HiveField(1)
  DZD,
  @HiveField(2)
  ARS,
  @HiveField(3)
  AMD,
  @HiveField(4)
  AWG,
  @HiveField(5)
  AUD,
  @HiveField(6)
  AZN,
  @HiveField(7)
  BSD,
  @HiveField(8)
  BHD,
  @HiveField(9)
  THB,
  @HiveField(10)
  PAB,
  @HiveField(11)
  BBD,
  @HiveField(12)
  BYN,
  @HiveField(13)
  BZD,
  @HiveField(14)
  BMD,
  @HiveField(15)
  VEF,
  @HiveField(16)
  VED,
  @HiveField(17)
  BOB,
  @HiveField(18)
  BRL,
  @HiveField(19)
  BND,
  @HiveField(20)
  BGN,
  @HiveField(21)
  BIF,
  @HiveField(22)
  CVE,
  @HiveField(23)
  CAD,
  @HiveField(24)
  KYD,
  @HiveField(25)
  XOF,
  @HiveField(26)
  XAF,
  @HiveField(27)
  XPF,
  @HiveField(28)
  CLP,
  @HiveField(29)
  COP,
  @HiveField(30)
  KMF,
  @HiveField(31)
  CDF,
  @HiveField(32)
  BAM,
  @HiveField(33)
  NIO,
  @HiveField(34)
  CRC,
  @HiveField(35)
  CUP,
  @HiveField(36)
  CZK,
  @HiveField(37)
  GMD,
  @HiveField(38)
  DKK,
  @HiveField(39)
  MKD,
  @HiveField(40)
  DJF,
  @HiveField(41)
  STN,
  @HiveField(42)
  DOP,
  @HiveField(43)
  VND,
  @HiveField(44)
  XCD,
  @HiveField(45)
  EGP,
  @HiveField(46)
  SVC,
  @HiveField(47)
  ETB,
  @HiveField(48)
  EUR,
  @HiveField(49)
  FKP,
  @HiveField(50)
  FJD,
  @HiveField(51)
  HUF,
  @HiveField(52)
  GHS,
  @HiveField(53)
  GIP,
  @HiveField(54)
  HTG,
  @HiveField(55)
  PYG,
  @HiveField(56)
  GNF,
  @HiveField(57)
  GYD,
  @HiveField(58)
  HKD,
  @HiveField(59)
  UAH,
  @HiveField(60)
  ISK,
  @HiveField(61)
  INR,
  @HiveField(62)
  IRR,
  @HiveField(63)
  IQD,
  @HiveField(64)
  JMD,
  @HiveField(65)
  JOD,
  @HiveField(66)
  KES,
  @HiveField(67)
  PGK,
  @HiveField(68)
  LAK,
  @HiveField(69)
  HRK,
  @HiveField(70)
  KWD,
  @HiveField(71)
  MWK,
  @HiveField(72)
  AOA,
  @HiveField(73)
  MMK,
  @HiveField(74)
  GEL,
  @HiveField(75)
  LBP,
  @HiveField(76)
  ALL,
  @HiveField(77)
  HNL,
  @HiveField(78)
  SLE,
  @HiveField(79)
  LRD,
  @HiveField(80)
  LYD,
  @HiveField(81)
  SZL,
  @HiveField(82)
  LSL,
  @HiveField(83)
  MGA,
  @HiveField(84)
  MYR,
  @HiveField(85)
  MUR,
  @HiveField(86)
  MXN,
  @HiveField(87)
  MXV,
  @HiveField(88)
  MDL,
  @HiveField(89)
  MAD,
  @HiveField(90)
  MZN,
  @HiveField(91)
  BOV,
  @HiveField(92)
  NGN,
  @HiveField(93)
  ERN,
  @HiveField(94)
  NAD,
  @HiveField(95)
  NPR,
  @HiveField(96)
  ANG,
  @HiveField(97)
  ILS,
  @HiveField(98)
  TWD,
  @HiveField(99)
  NZD,
  @HiveField(100)
  BTN,
  @HiveField(101)
  KPW,
  @HiveField(102)
  NOK,
  @HiveField(103)
  PEN,
  @HiveField(104)
  MRU,
  @HiveField(105)
  PKR,
  @HiveField(106)
  MOP,
  @HiveField(107)
  TOP,
  @HiveField(108)
  CUC,
  @HiveField(109)
  UYU,
  @HiveField(110)
  PHP,
  @HiveField(111)
  GBP,
  @HiveField(112)
  BWP,
  @HiveField(113)
  QAR,
  @HiveField(114)
  GTQ,
  @HiveField(115)
  ZAR,
  @HiveField(116)
  OMR,
  @HiveField(117)
  KHR,
  @HiveField(118)
  RON,
  @HiveField(119)
  MVR,
  @HiveField(120)
  IDR,
  @HiveField(121)
  RUB,
  @HiveField(122)
  RWF,
  @HiveField(123)
  SHP,
  @HiveField(124)
  SAR,
  @HiveField(125)
  XDR,
  @HiveField(126)
  RSD,
  @HiveField(127)
  SCR,
  @HiveField(128)
  SGD,
  @HiveField(129)
  SBD,
  @HiveField(130)
  KGS,
  @HiveField(131)
  SOS,
  @HiveField(132)
  TJS,
  @HiveField(133)
  SSP,
  @HiveField(134)
  LKR,
  @HiveField(135)
  XSU,
  @HiveField(136)
  SDG,
  @HiveField(137)
  SRD,
  @HiveField(138)
  SEK,
  @HiveField(139)
  CHF,
  @HiveField(140)
  SYP,
  @HiveField(141)
  BDT,
  @HiveField(142)
  WST,
  @HiveField(143)
  TZS,
  @HiveField(144)
  KZT,
  @HiveField(145)
  TTD,
  @HiveField(146)
  MNT,
  @HiveField(147)
  TND,
  @HiveField(148)
  TRY,
  @HiveField(149)
  TMT,
  @HiveField(150)
  AED,
  @HiveField(151)
  UGX,
  @HiveField(152)
  CLF,
  @HiveField(153)
  COU,
  @HiveField(154)
  UYI,
  @HiveField(155)
  USD,
  @HiveField(156)
  UZS,
  @HiveField(157)
  VUV,
  @HiveField(158)
  CHE,
  @HiveField(159)
  CHW,
  @HiveField(160)
  KRW,
  @HiveField(161)
  YER,
  @HiveField(162)
  JPY,
  @HiveField(163)
  CNY,
  @HiveField(164)
  ZMW,
  @HiveField(165)
  ZWL,
  @HiveField(166)
  PLN,
}

class Currencyhelper {
  static const List<String> currencysymbols = [
    'AFN',
    'DZD',
    'ARS',
    'AMD',
    'AWG',
    'AUD',
    'AZN',
    'BSD',
    'BHD',
    'THB',
    'PAB',
    'BBD',
    'BYN',
    'BZD',
    'BMD',
    'VEF',
    'VED',
    'BOB',
    'BRL',
    'BND',
    'BGN',
    'BIF',
    'CVE',
    'CAD',
    'KYD',
    'XOF',
    'XAF',
    'XPF',
    'CLP',
    'COP',
    'KMF',
    'CDF',
    'BAM',
    'NIO',
    'CRC',
    'CUP',
    'CZK',
    'GMD',
    'DKK',
    'MKD',
    'DJF',
    'STN',
    'DOP',
    'VND',
    'XCD',
    'EGP',
    'SVC',
    'ETB',
    'EUR',
    'FKP',
    'FJD',
    'HUF',
    'GHS',
    'GIP',
    'HTG',
    'PYG',
    'GNF',
    'GYD',
    'HKD',
    'UAH',
    'ISK',
    'INR',
    'IRR',
    'IQD',
    'JMD',
    'JOD',
    'KES',
    'PGK',
    'LAK',
    'HRK',
    'KWD',
    'MWK',
    'AOA',
    'MMK',
    'GEL',
    'LBP',
    'ALL',
    'HNL',
    'SLE',
    'LRD',
    'LYD',
    'SZL',
    'LSL',
    'MGA',
    'MYR',
    'MUR',
    'MXN',
    'MXV',
    'MDL',
    'MAD',
    'MZN',
    'BOV',
    'NGN',
    'ERN',
    'NAD',
    'NPR',
    'ANG',
    'ILS',
    'TWD',
    'NZD',
    'BTN',
    'KPW',
    'NOK',
    'PEN',
    'MRU',
    'PKR',
    'MOP',
    'TOP',
    'CUC',
    'UYU',
    'PHP',
    'GBP',
    'BWP',
    'QAR',
    'GTQ',
    'ZAR',
    'OMR',
    'KHR',
    'RON',
    'MVR',
    'IDR',
    'RUB',
    'RWF',
    'SHP',
    'SAR',
    'XDR',
    'RSD',
    'SCR',
    'SGD',
    'SBD',
    'KGS',
    'SOS',
    'TJS',
    'SSP',
    'LKR',
    'XSU',
    'SDG',
    'SRD',
    'SEK',
    'CHF',
    'SYP',
    'BDT',
    'WST',
    'TZS',
    'KZT',
    'TTD',
    'MNT',
    'TND',
    'TRY',
    'TMT',
    'AED',
    'UGX',
    'CLF',
    'COU',
    'UYI',
    'USD',
    'UZS',
    'VUV',
    'CHE',
    'CHW',
    'KRW',
    'YER',
    'JPY',
    'CNY',
    'ZMW',
    'ZWL',
    'PLN',
  ];

  static String getCurrencySymbol(Currency currency) {
    int index = currency.index;
    if (index >= 0 && index < currencysymbols.length) {
      return currencysymbols[index];
    } else {
      return 'Unknown Currency';
    }
  }
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
  final Currency currency;
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
