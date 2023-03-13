import 'package:equatable/equatable.dart';

import 'quote_entity.dart';

class IndicatorsEntity extends Equatable {
  final List<QuoteEntity> quote;

  const IndicatorsEntity({required this.quote});
  @override
  List<Object?> get props => [quote];
}
