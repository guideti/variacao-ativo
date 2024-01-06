import 'package:get/get.dart';

import '../ui/ui.dart';
import './factories/factories.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: Get.key,
      title: 'Yahoo Finance - Variação de Ativo',
      enableLog: kDebugMode,
      debugShowCheckedModeBanner: false,
      theme: appThemeLight,
      darkTheme: appThemeDark,
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: makeSplashPage,
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: '/home',
          page: makeHomePage,
          transition: Transition.fadeIn,
        ),
      ],
    );
  }
}
