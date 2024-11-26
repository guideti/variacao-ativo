abstract class SnackbarMessage {
  final String message;
  final List<String> details;

  SnackbarMessage({
    required this.message,
    required this.details,
  });
}

class UISnackbarMessage extends SnackbarMessage {
  UISnackbarMessage({
    required String message,
    required List<String> details,
  }) : super(
          message: message,
          details: details,
        );
}
