import 'quote.dart';

class Indicator {
  List<Quote> quote;
  Indicator(this.quote);
  Indicator.fromJson(Map<String, dynamic> json)
      : quote = (json['quote'] as List).map((e) => Quote.fromJson(e)).toList();
}
