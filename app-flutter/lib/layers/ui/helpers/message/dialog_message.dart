import 'dart:ui';

abstract class DialogMessage {
  final String title;
  final String description;
  final String button;
  final VoidCallback onPressed;

  DialogMessage({
    required this.title,
    required this.description,
    required this.button,
    required this.onPressed,
  });
}

class UIDialogMessage extends DialogMessage {
  UIDialogMessage({
    required String title,
    required String description,
    required String button,
    required VoidCallback onPressed,
  }) : super(
          title: title,
          description: description,
          button: button,
          onPressed: onPressed,
        );
}
