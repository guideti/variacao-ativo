class ChartEntity {
  final String symbol;
  final List<DateTime> timestamp;
  final List<double> open;

  const ChartEntity({
    required this.symbol,
    required this.timestamp,
    required this.open,
  });
}
