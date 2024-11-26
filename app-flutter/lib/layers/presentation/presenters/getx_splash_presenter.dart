import 'package:get/get.dart';

import '../../presentation/mixins/mixins.dart';
import '../../ui/pages/pages.dart';

class GetxSplashPresenter extends GetxController with LoadingManager, NavigationManager, UISnackbarMessageManager implements SplashPresenter {
  GetxSplashPresenter();

  @override
  void onInit() {
    configure();

    super.onInit();
  }

  Future<void> configure() async {
    await Future.delayed(const Duration(seconds: 1));

    navigateTo = {'/home': true};
  }
}
