import 'package:get/get.dart';

enum IntervalEnum {
  oneDay,
  fiveDay,
  oneMonth,
  threeMonth,
}

extension IntervalExtension on IntervalEnum {
  String toDescription() {
    switch (this) {
      case IntervalEnum.oneDay:
        return "1 dia".tr;
      case IntervalEnum.fiveDay:
        return "5 dias".tr;
      case IntervalEnum.oneMonth:
        return "1 mês".tr;
      case IntervalEnum.threeMonth:
        return "3 meses".tr;
    }
  }

  String toParams() {
    switch (this) {
      case IntervalEnum.oneDay:
        return "1d";
      case IntervalEnum.fiveDay:
        return "5d";
      case IntervalEnum.oneMonth:
        return "1mo";
      case IntervalEnum.threeMonth:
        return "3mo";
    }
  }
}
