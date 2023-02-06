import 'package:intl/intl.dart';

extension DoubleFormatExtension on double? {
  String toCurrency({int decimalDigits = 2}) => this == null
      ? '-'
      : NumberFormat.compactCurrency(locale: 'pt_BR', symbol: 'R\$', decimalDigits: decimalDigits).format(this);
}
