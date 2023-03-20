extension ValidString on String? {
  bool isValid() {
    if (this != null) {
      if (this!.trim().isNotEmpty && this!.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  String cleanToParam() {
    if (isValid()) {
      return this!.replaceAll('/', '').replaceAll('?', '');
    } else {
      return '';
    }
  }
}
