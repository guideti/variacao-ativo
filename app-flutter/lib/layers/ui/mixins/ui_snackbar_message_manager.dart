import '../ui.dart';

mixin UISnackbarMessageManager {
  void handleSnackbarMessage(
    Stream<SnackbarMessage?> stream,
    BuildContext context, {
    int milliseconds = 5000,
  }) =>
      stream.where((event) => event != null).listen(
            (message) => showSnackbarMessage(
              message: message?.message ?? '',
              errors: message?.details ?? [],
              context: context,
              milliseconds: milliseconds,
            ),
          );
}
