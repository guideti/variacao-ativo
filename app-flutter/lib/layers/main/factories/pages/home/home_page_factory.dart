import 'package:get/get.dart';

import '../../../../ui/ui.dart';
import 'home_presenter_factory.dart';

Widget makeHomePage() {
  final presenter = Get.put<HomePresenter>(makeGetxHomePresenter());
  return HomePage(presenter);
}
