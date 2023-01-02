class Quote {
  List<double> quoteOpen;
  Quote(this.quoteOpen);
  Quote.fromJson(Map<String, dynamic> json)
      : quoteOpen =
            (json['open'] as List).map((e) => (e ?? 0.0) as double).toList();
}
