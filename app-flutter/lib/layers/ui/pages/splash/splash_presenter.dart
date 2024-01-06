import '../../helpers/helpers.dart';

abstract class SplashPresenter {
  Stream<SnackbarMessage?> get mainSnackbarMessageStream;
  Stream<Map<String, bool>?> get navigateToStream;
}
