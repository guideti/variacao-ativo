import 'package:get/get.dart';

import '../../../../ui/ui.dart';
import 'splash_presenter_factory.dart';

Widget makeSplashPage() {
  final presenter = Get.put<SplashPresenter>(makeGetxSplashPresenter());
  return SplashPage(presenter);
}
