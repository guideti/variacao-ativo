
import '../../domain/entities/indicators_entity.dart';
import 'quote_model.dart';

class IndicatorsModel extends IndicatorsEntity {
  const IndicatorsModel({required super.quote});

  factory IndicatorsModel.fromJson(Map<String, dynamic> json) =>
      IndicatorsModel(
        quote: (json['quote'] as List)
            .map(
              (e) => QuoteModel.fromJson(e),
            )
            .toList(),
      );
}
