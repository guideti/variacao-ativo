import 'package:get/get.dart';

mixin NavigationManager {
  void handleNavigation(Stream<Map<String, bool>?> stream) {
    stream.where((event) => event != null && event.isNotEmpty == true).listen((map) {
      if (map != null && map.keys.isNotEmpty && map.keys.first.isNotEmpty) {
        bool keyValid = map.keys.isNotEmpty && map.keys.first.isNotEmpty;
        bool valueNotEmpty = map.values.isNotEmpty;

        if (keyValid && map.keys.first == 'back') {
          Get.back();
        } else if (keyValid && valueNotEmpty && map.values.first) {
          Get.offAllNamed(map.keys.first);
        } else if (keyValid) {
          Get.toNamed(map.keys.first);
        }
      }
    });
  }
}
