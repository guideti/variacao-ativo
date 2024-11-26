import 'package:get/get.dart';

mixin LoadingManager on GetxController {
  final _isLoading = false.obs;
  RxBool get isLoadingRx => _isLoading;
  set isLoading(bool value) => _isLoading.value = value;
}
