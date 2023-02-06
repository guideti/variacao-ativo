import 'package:intl/intl.dart';

extension DoubleFormatExtension on double? {
  String toCurrency({int decimalDigits = 2}) => this == null
      ? '-'
      : NumberFormat.compactCurrency(locale: 'pt_BR', symbol: 'R\$', decimalDigits: decimalDigits).format(this);

  String toPercentage() =>
      this == null ? '-' : NumberFormat.decimalPercentPattern(locale: 'pt_BR', decimalDigits: 2).format(this);
}
