import 'package:intl/intl.dart';

extension DoubleFormatExtension on double? {
  String toCurrency({int decimalDigits = 2}) => this == null
      ? '-'
      : NumberFormat.compactCurrency(locale: 'pt_BR', symbol: 'R\$', decimalDigits: decimalDigits).format(this);

  String toPercentage() =>
      this == null ? '-' : NumberFormat.decimalPercentPattern(locale: 'pt_BR', decimalDigits: 2).format(this);
}

extension DateTimeFormatExtension on DateTime {
  // Format: 22/1
  String toShortString() => DateFormat.Md('pt_BR').format(this);

  // Format: 6 de fev.
  String toMidString() => DateFormat.MMMd('pt_BR').format(this);

  // Format: 22/01/2023
  String toLongString() => DateFormat.yMd('pt_BR').format(this);
}
