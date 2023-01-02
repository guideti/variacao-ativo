class AssetChangeTable {
  final int day;
  final String date;
  final double price;
  double? percent;
  double? percentFirstDate;

  AssetChangeTable(
      {required this.day,
      required this.date,
      required this.price,
      this.percent,
      this.percentFirstDate});
}
