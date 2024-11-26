class ChartViewModel {
  final String date;
  final double variationInRelationToDMinus1;
  final double variationFromTheFirstDate;

  ChartViewModel({
    required this.date,
    required this.variationInRelationToDMinus1,
    required this.variationFromTheFirstDate,
  });
}
