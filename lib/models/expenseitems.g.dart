// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expenseitems.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryAdapter extends TypeAdapter<Category> {
  @override
  final int typeId = 1;

  @override
  Category read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Category.medical;
      case 1:
        return Category.communication;
      case 2:
        return Category.personal;
      case 3:
        return Category.work;
      case 4:
        return Category.utilities;
      case 5:
        return Category.groceries;
        case 6: 
        return Category.others;
      default:
        return Category.medical;
        
    }
  }

  @override
  void write(BinaryWriter writer, Category obj) {
    switch (obj) {
      case Category.medical:
        writer.writeByte(0);
        break;
      case Category.communication:
        writer.writeByte(1);
        break;
      case Category.personal:
        writer.writeByte(2);
        break;
      case Category.work:
        writer.writeByte(3);
        break;
      case Category.utilities:
        writer.writeByte(4);
        break;
      case Category.groceries:
        writer.writeByte(5);
        break;
        case Category.others:
        writer.writeByte(6);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CurrencyAdapter extends TypeAdapter<Currency> {
  @override
  final int typeId = 2;

  @override
  Currency read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Currency.AFN;
      case 1:
        return Currency.DZD;
      case 2:
        return Currency.ARS;
      case 3:
        return Currency.AMD;
      case 4:
        return Currency.AWG;
      case 5:
        return Currency.AUD;
      case 6:
        return Currency.AZN;
      case 7:
        return Currency.BSD;
      case 8:
        return Currency.BHD;
      case 9:
        return Currency.THB;
      case 10:
        return Currency.PAB;
      case 11:
        return Currency.BBD;
      case 12:
        return Currency.BYN;
      case 13:
        return Currency.BZD;
      case 14:
        return Currency.BMD;
      case 15:
        return Currency.VEF;
      case 16:
        return Currency.VED;
      case 17:
        return Currency.BOB;
      case 18:
        return Currency.BRL;
      case 19:
        return Currency.BND;
      case 20:
        return Currency.BGN;
      case 21:
        return Currency.BIF;
      case 22:
        return Currency.CVE;
      case 23:
        return Currency.CAD;
      case 24:
        return Currency.KYD;
      case 25:
        return Currency.XOF;
      case 26:
        return Currency.XAF;
      case 27:
        return Currency.XPF;
      case 28:
        return Currency.CLP;
      case 29:
        return Currency.COP;
      case 30:
        return Currency.KMF;
      case 31:
        return Currency.CDF;
      case 32:
        return Currency.BAM;
      case 33:
        return Currency.NIO;
      case 34:
        return Currency.CRC;
      case 35:
        return Currency.CUP;
      case 36:
        return Currency.CZK;
      case 37:
        return Currency.GMD;
      case 38:
        return Currency.DKK;
      case 39:
        return Currency.MKD;
      case 40:
        return Currency.DJF;
      case 41:
        return Currency.STN;
      case 42:
        return Currency.DOP;
      case 43:
        return Currency.VND;
      case 44:
        return Currency.XCD;
      case 45:
        return Currency.EGP;
      case 46:
        return Currency.SVC;
      case 47:
        return Currency.ETB;
      case 48:
        return Currency.EUR;
      case 49:
        return Currency.FKP;
      case 50:
        return Currency.FJD;
      case 51:
        return Currency.HUF;
      case 52:
        return Currency.GHS;
      case 53:
        return Currency.GIP;
      case 54:
        return Currency.HTG;
      case 55:
        return Currency.PYG;
      case 56:
        return Currency.GNF;
      case 57:
        return Currency.GYD;
      case 58:
        return Currency.HKD;
      case 59:
        return Currency.UAH;
      case 60:
        return Currency.ISK;
      case 61:
        return Currency.INR;
      case 62:
        return Currency.IRR;
      case 63:
        return Currency.IQD;
      case 64:
        return Currency.JMD;
      case 65:
        return Currency.JOD;
      case 66:
        return Currency.KES;
      case 67:
        return Currency.PGK;
      case 68:
        return Currency.LAK;
      case 69:
        return Currency.HRK;
      case 70:
        return Currency.KWD;
      case 71:
        return Currency.MWK;
      case 72:
        return Currency.AOA;
      case 73:
        return Currency.MMK;
      case 74:
        return Currency.GEL;
      case 75:
        return Currency.LBP;
      case 76:
        return Currency.ALL;
      case 77:
        return Currency.HNL;
      case 78:
        return Currency.SLE;
      case 79:
        return Currency.LRD;
      case 80:
        return Currency.LYD;
      case 81:
        return Currency.SZL;
      case 82:
        return Currency.LSL;
      case 83:
        return Currency.MGA;
      case 84:
        return Currency.MYR;
      case 85:
        return Currency.MUR;
      case 86:
        return Currency.MXN;
      case 87:
        return Currency.MXV;
      case 88:
        return Currency.MDL;
      case 89:
        return Currency.MAD;
      case 90:
        return Currency.MZN;
      case 91:
        return Currency.BOV;
      case 92:
        return Currency.NGN;
      case 93:
        return Currency.ERN;
      case 94:
        return Currency.NAD;
      case 95:
        return Currency.NPR;
      case 96:
        return Currency.ANG;
      case 97:
        return Currency.ILS;
      case 98:
        return Currency.TWD;
      case 99:
        return Currency.NZD;
      case 100:
        return Currency.BTN;
      case 101:
        return Currency.KPW;
      case 102:
        return Currency.NOK;
      case 103:
        return Currency.PEN;
      case 104:
        return Currency.MRU;
      case 105:
        return Currency.PKR;
      case 106:
        return Currency.MOP;
      case 107:
        return Currency.TOP;
      case 108:
        return Currency.CUC;
      case 109:
        return Currency.UYU;
      case 110:
        return Currency.PHP;
      case 111:
        return Currency.GBP;
      case 112:
        return Currency.BWP;
      case 113:
        return Currency.QAR;
      case 114:
        return Currency.GTQ;
      case 115:
        return Currency.ZAR;
      case 116:
        return Currency.OMR;
      case 117:
        return Currency.KHR;
      case 118:
        return Currency.RON;
      case 119:
        return Currency.MVR;
      case 120:
        return Currency.IDR;
      case 121:
        return Currency.RUB;
      case 122:
        return Currency.RWF;
      case 123:
        return Currency.SHP;
      case 124:
        return Currency.SAR;
      case 125:
        return Currency.XDR;
      case 126:
        return Currency.RSD;
      case 127:
        return Currency.SCR;
      case 128:
        return Currency.SGD;
      case 129:
        return Currency.SBD;
      case 130:
        return Currency.KGS;
      case 131:
        return Currency.SOS;
      case 132:
        return Currency.TJS;
      case 133:
        return Currency.SSP;
      case 134:
        return Currency.LKR;
      case 135:
        return Currency.XSU;
      case 136:
        return Currency.SDG;
      case 137:
        return Currency.SRD;
      case 138:
        return Currency.SEK;
      case 139:
        return Currency.CHF;
      case 140:
        return Currency.SYP;
      case 141:
        return Currency.BDT;
      case 142:
        return Currency.WST;
      case 143:
        return Currency.TZS;
      case 144:
        return Currency.KZT;
      case 145:
        return Currency.TTD;
      case 146:
        return Currency.MNT;
      case 147:
        return Currency.TND;
      case 148:
        return Currency.TRY;
      case 149:
        return Currency.TMT;
      case 150:
        return Currency.AED;
      case 151:
        return Currency.UGX;
      case 152:
        return Currency.CLF;
      case 153:
        return Currency.COU;
      case 154:
        return Currency.UYI;
      case 155:
        return Currency.USD;
      case 156:
        return Currency.UZS;
      case 157:
        return Currency.VUV;
      case 158:
        return Currency.CHE;
      case 159:
        return Currency.CHW;
      case 160:
        return Currency.KRW;
      case 161:
        return Currency.YER;
      case 162:
        return Currency.JPY;
      case 163:
        return Currency.CNY;
      case 164:
        return Currency.ZMW;
      case 165:
        return Currency.ZWL;
      case 166:
        return Currency.PLN;
      default:
        return Currency.AFN;
    }
  }

  @override
  void write(BinaryWriter writer, Currency obj) {
    switch (obj) {
      case Currency.AFN:
        writer.writeByte(0);
        break;
      case Currency.DZD:
        writer.writeByte(1);
        break;
      case Currency.ARS:
        writer.writeByte(2);
        break;
      case Currency.AMD:
        writer.writeByte(3);
        break;
      case Currency.AWG:
        writer.writeByte(4);
        break;
      case Currency.AUD:
        writer.writeByte(5);
        break;
      case Currency.AZN:
        writer.writeByte(6);
        break;
      case Currency.BSD:
        writer.writeByte(7);
        break;
      case Currency.BHD:
        writer.writeByte(8);
        break;
      case Currency.THB:
        writer.writeByte(9);
        break;
      case Currency.PAB:
        writer.writeByte(10);
        break;
      case Currency.BBD:
        writer.writeByte(11);
        break;
      case Currency.BYN:
        writer.writeByte(12);
        break;
      case Currency.BZD:
        writer.writeByte(13);
        break;
      case Currency.BMD:
        writer.writeByte(14);
        break;
      case Currency.VEF:
        writer.writeByte(15);
        break;
      case Currency.VED:
        writer.writeByte(16);
        break;
      case Currency.BOB:
        writer.writeByte(17);
        break;
      case Currency.BRL:
        writer.writeByte(18);
        break;
      case Currency.BND:
        writer.writeByte(19);
        break;
      case Currency.BGN:
        writer.writeByte(20);
        break;
      case Currency.BIF:
        writer.writeByte(21);
        break;
      case Currency.CVE:
        writer.writeByte(22);
        break;
      case Currency.CAD:
        writer.writeByte(23);
        break;
      case Currency.KYD:
        writer.writeByte(24);
        break;
      case Currency.XOF:
        writer.writeByte(25);
        break;
      case Currency.XAF:
        writer.writeByte(26);
        break;
      case Currency.XPF:
        writer.writeByte(27);
        break;
      case Currency.CLP:
        writer.writeByte(28);
        break;
      case Currency.COP:
        writer.writeByte(29);
        break;
      case Currency.KMF:
        writer.writeByte(30);
        break;
      case Currency.CDF:
        writer.writeByte(31);
        break;
      case Currency.BAM:
        writer.writeByte(32);
        break;
      case Currency.NIO:
        writer.writeByte(33);
        break;
      case Currency.CRC:
        writer.writeByte(34);
        break;
      case Currency.CUP:
        writer.writeByte(35);
        break;
      case Currency.CZK:
        writer.writeByte(36);
        break;
      case Currency.GMD:
        writer.writeByte(37);
        break;
      case Currency.DKK:
        writer.writeByte(38);
        break;
      case Currency.MKD:
        writer.writeByte(39);
        break;
      case Currency.DJF:
        writer.writeByte(40);
        break;
      case Currency.STN:
        writer.writeByte(41);
        break;
      case Currency.DOP:
        writer.writeByte(42);
        break;
      case Currency.VND:
        writer.writeByte(43);
        break;
      case Currency.XCD:
        writer.writeByte(44);
        break;
      case Currency.EGP:
        writer.writeByte(45);
        break;
      case Currency.SVC:
        writer.writeByte(46);
        break;
      case Currency.ETB:
        writer.writeByte(47);
        break;
      case Currency.EUR:
        writer.writeByte(48);
        break;
      case Currency.FKP:
        writer.writeByte(49);
        break;
      case Currency.FJD:
        writer.writeByte(50);
        break;
      case Currency.HUF:
        writer.writeByte(51);
        break;
      case Currency.GHS:
        writer.writeByte(52);
        break;
      case Currency.GIP:
        writer.writeByte(53);
        break;
      case Currency.HTG:
        writer.writeByte(54);
        break;
      case Currency.PYG:
        writer.writeByte(55);
        break;
      case Currency.GNF:
        writer.writeByte(56);
        break;
      case Currency.GYD:
        writer.writeByte(57);
        break;
      case Currency.HKD:
        writer.writeByte(58);
        break;
      case Currency.UAH:
        writer.writeByte(59);
        break;
      case Currency.ISK:
        writer.writeByte(60);
        break;
      case Currency.INR:
        writer.writeByte(61);
        break;
      case Currency.IRR:
        writer.writeByte(62);
        break;
      case Currency.IQD:
        writer.writeByte(63);
        break;
      case Currency.JMD:
        writer.writeByte(64);
        break;
      case Currency.JOD:
        writer.writeByte(65);
        break;
      case Currency.KES:
        writer.writeByte(66);
        break;
      case Currency.PGK:
        writer.writeByte(67);
        break;
      case Currency.LAK:
        writer.writeByte(68);
        break;
      case Currency.HRK:
        writer.writeByte(69);
        break;
      case Currency.KWD:
        writer.writeByte(70);
        break;
      case Currency.MWK:
        writer.writeByte(71);
        break;
      case Currency.AOA:
        writer.writeByte(72);
        break;
      case Currency.MMK:
        writer.writeByte(73);
        break;
      case Currency.GEL:
        writer.writeByte(74);
        break;
      case Currency.LBP:
        writer.writeByte(75);
        break;
      case Currency.ALL:
        writer.writeByte(76);
        break;
      case Currency.HNL:
        writer.writeByte(77);
        break;
      case Currency.SLE:
        writer.writeByte(78);
        break;
      case Currency.LRD:
        writer.writeByte(79);
        break;
      case Currency.LYD:
        writer.writeByte(80);
        break;
      case Currency.SZL:
        writer.writeByte(81);
        break;
      case Currency.LSL:
        writer.writeByte(82);
        break;
      case Currency.MGA:
        writer.writeByte(83);
        break;
      case Currency.MYR:
        writer.writeByte(84);
        break;
      case Currency.MUR:
        writer.writeByte(85);
        break;
      case Currency.MXN:
        writer.writeByte(86);
        break;
      case Currency.MXV:
        writer.writeByte(87);
        break;
      case Currency.MDL:
        writer.writeByte(88);
        break;
      case Currency.MAD:
        writer.writeByte(89);
        break;
      case Currency.MZN:
        writer.writeByte(90);
        break;
      case Currency.BOV:
        writer.writeByte(91);
        break;
      case Currency.NGN:
        writer.writeByte(92);
        break;
      case Currency.ERN:
        writer.writeByte(93);
        break;
      case Currency.NAD:
        writer.writeByte(94);
        break;
      case Currency.NPR:
        writer.writeByte(95);
        break;
      case Currency.ANG:
        writer.writeByte(96);
        break;
      case Currency.ILS:
        writer.writeByte(97);
        break;
      case Currency.TWD:
        writer.writeByte(98);
        break;
      case Currency.NZD:
        writer.writeByte(99);
        break;
      case Currency.BTN:
        writer.writeByte(100);
        break;
      case Currency.KPW:
        writer.writeByte(101);
        break;
      case Currency.NOK:
        writer.writeByte(102);
        break;
      case Currency.PEN:
        writer.writeByte(103);
        break;
      case Currency.MRU:
        writer.writeByte(104);
        break;
      case Currency.PKR:
        writer.writeByte(105);
        break;
      case Currency.MOP:
        writer.writeByte(106);
        break;
      case Currency.TOP:
        writer.writeByte(107);
        break;
      case Currency.CUC:
        writer.writeByte(108);
        break;
      case Currency.UYU:
        writer.writeByte(109);
        break;
      case Currency.PHP:
        writer.writeByte(110);
        break;
      case Currency.GBP:
        writer.writeByte(111);
        break;
      case Currency.BWP:
        writer.writeByte(112);
        break;
      case Currency.QAR:
        writer.writeByte(113);
        break;
      case Currency.GTQ:
        writer.writeByte(114);
        break;
      case Currency.ZAR:
        writer.writeByte(115);
        break;
      case Currency.OMR:
        writer.writeByte(116);
        break;
      case Currency.KHR:
        writer.writeByte(117);
        break;
      case Currency.RON:
        writer.writeByte(118);
        break;
      case Currency.MVR:
        writer.writeByte(119);
        break;
      case Currency.IDR:
        writer.writeByte(120);
        break;
      case Currency.RUB:
        writer.writeByte(121);
        break;
      case Currency.RWF:
        writer.writeByte(122);
        break;
      case Currency.SHP:
        writer.writeByte(123);
        break;
      case Currency.SAR:
        writer.writeByte(124);
        break;
      case Currency.XDR:
        writer.writeByte(125);
        break;
      case Currency.RSD:
        writer.writeByte(126);
        break;
      case Currency.SCR:
        writer.writeByte(127);
        break;
      case Currency.SGD:
        writer.writeByte(128);
        break;
      case Currency.SBD:
        writer.writeByte(129);
        break;
      case Currency.KGS:
        writer.writeByte(130);
        break;
      case Currency.SOS:
        writer.writeByte(131);
        break;
      case Currency.TJS:
        writer.writeByte(132);
        break;
      case Currency.SSP:
        writer.writeByte(133);
        break;
      case Currency.LKR:
        writer.writeByte(134);
        break;
      case Currency.XSU:
        writer.writeByte(135);
        break;
      case Currency.SDG:
        writer.writeByte(136);
        break;
      case Currency.SRD:
        writer.writeByte(137);
        break;
      case Currency.SEK:
        writer.writeByte(138);
        break;
      case Currency.CHF:
        writer.writeByte(139);
        break;
      case Currency.SYP:
        writer.writeByte(140);
        break;
      case Currency.BDT:
        writer.writeByte(141);
        break;
      case Currency.WST:
        writer.writeByte(142);
        break;
      case Currency.TZS:
        writer.writeByte(143);
        break;
      case Currency.KZT:
        writer.writeByte(144);
        break;
      case Currency.TTD:
        writer.writeByte(145);
        break;
      case Currency.MNT:
        writer.writeByte(146);
        break;
      case Currency.TND:
        writer.writeByte(147);
        break;
      case Currency.TRY:
        writer.writeByte(148);
        break;
      case Currency.TMT:
        writer.writeByte(149);
        break;
      case Currency.AED:
        writer.writeByte(150);
        break;
      case Currency.UGX:
        writer.writeByte(151);
        break;
      case Currency.CLF:
        writer.writeByte(152);
        break;
      case Currency.COU:
        writer.writeByte(153);
        break;
      case Currency.UYI:
        writer.writeByte(154);
        break;
      case Currency.USD:
        writer.writeByte(155);
        break;
      case Currency.UZS:
        writer.writeByte(156);
        break;
      case Currency.VUV:
        writer.writeByte(157);
        break;
      case Currency.CHE:
        writer.writeByte(158);
        break;
      case Currency.CHW:
        writer.writeByte(159);
        break;
      case Currency.KRW:
        writer.writeByte(160);
        break;
      case Currency.YER:
        writer.writeByte(161);
        break;
      case Currency.JPY:
        writer.writeByte(162);
        break;
      case Currency.CNY:
        writer.writeByte(163);
        break;
      case Currency.ZMW:
        writer.writeByte(164);
        break;
      case Currency.ZWL:
        writer.writeByte(165);
        break;
      case Currency.PLN:
        writer.writeByte(166);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrencyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
