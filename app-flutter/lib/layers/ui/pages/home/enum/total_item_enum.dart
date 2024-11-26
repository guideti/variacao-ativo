import 'package:get/get.dart';

enum TotalItemEnum {
  five,
  fifteen,
  thirty,
  fortyFive,
}

extension TotalItemExtension on TotalItemEnum {
  String toDescription() {
    switch (this) {
      case TotalItemEnum.five:
        return "5 items".tr;
      case TotalItemEnum.fifteen:
        return "15 items".tr;
      case TotalItemEnum.thirty:
        return "30 items".tr;
      case TotalItemEnum.fortyFive:
        return "45 items".tr;
    }
  }

  int toCount() {
    switch (this) {
      case TotalItemEnum.five:
        return 5;
      case TotalItemEnum.fifteen:
        return 15;
      case TotalItemEnum.thirty:
        return 30;
      case TotalItemEnum.fortyFive:
        return 45;
    }
  }
}
