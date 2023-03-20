import 'package:get/get.dart';

mixin NavigationManager on GetxController {
  final _navigateTo = Rx<Map<String, bool>?>(null);
  Stream<Map<String, bool>?> get navigateToStream => _navigateTo.stream;
  set navigateTo(Map<String, bool> value) => _navigateTo.subject.add(value);
}
