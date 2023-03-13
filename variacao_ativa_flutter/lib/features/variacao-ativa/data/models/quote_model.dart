import '../../domain/entities/quote_entity.dart';

class QuoteModel extends QuoteEntity {
  const QuoteModel({required super.open});

  factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
        open: json['open'],
      );
}
