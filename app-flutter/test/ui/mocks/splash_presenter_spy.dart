import 'dart:async';
import 'package:ativo/layers/ui/pages/pages.dart';
import 'package:mocktail/mocktail.dart';

class SplashPresenterSpy extends Mock implements SplashPresenter {
  final navigateToController = StreamController<Map<String, bool>?>();

  SplashPresenterSpy() {
    when(() => navigateToStream).thenAnswer((_) => navigateToController.stream);
  }
  void emitNavigateTo(Map<String, bool> route) => navigateToController.add(route);

  void dispose() {
    navigateToController.close();
  }
}
