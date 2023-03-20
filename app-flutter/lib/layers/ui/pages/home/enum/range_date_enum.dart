import 'package:get/get.dart';

enum RangeDateEnum {
  oneDay,
  oneWeek,
  oneMonth,
  oneYear,
}

extension RangeDateExtension on RangeDateEnum {
  String toDescription() {
    switch (this) {
      case RangeDateEnum.oneDay:
        return "1 dia".tr;
      case RangeDateEnum.oneWeek:
        return "1 semana".tr;
      case RangeDateEnum.oneMonth:
        return "1 mês".tr;
      case RangeDateEnum.oneYear:
        return "1 ano".tr;
    }
  }

  String toParams() {
    switch (this) {
      case RangeDateEnum.oneDay:
        return "1d";
      case RangeDateEnum.oneWeek:
        return "1w";
      case RangeDateEnum.oneMonth:
        return "1m";
      case RangeDateEnum.oneYear:
        return "1y";
    }
  }
}
