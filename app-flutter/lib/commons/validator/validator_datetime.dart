extension ValidDateTimeNull on DateTime? {
  bool isValid() => this != null;
}

extension ValidDateTime on DateTime {
  String formart() => "${day.toString().padLeft(2, '0')}/${month.toString().padLeft(2, '0')}/${year.toString()}";
}
