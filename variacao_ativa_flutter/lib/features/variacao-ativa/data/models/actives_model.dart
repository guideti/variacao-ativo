
import 'package:variacao_ativa_flutter/features/variacao-ativa/domain/entities/actives_entity.dart';

class ActiveModel extends ActiveEntity {
  const ActiveModel({required super.quote});

  factory ActiveModel.fromJson(Map<String, dynamic> json) {
    final result = Map.castFrom(json['indicators']);
    final quote = List<double?>.from(result['quote'][0]['open']);
    return ActiveModel(
      quote: quote,
    );
  }
}
