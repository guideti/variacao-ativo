import 'package:get/get.dart';

import '../../ui/helpers/helpers.dart';

mixin UISnackbarMessageManager on GetxController {
  final Rx<SnackbarMessage?> _mainSnackbarMessage = Rx<SnackbarMessage?>(null);
  Stream<SnackbarMessage?> get mainSnackbarMessageStream => _mainSnackbarMessage.stream;
  set mainSnackbarMessage(SnackbarMessage? value) => _mainSnackbarMessage.value = value;
}
