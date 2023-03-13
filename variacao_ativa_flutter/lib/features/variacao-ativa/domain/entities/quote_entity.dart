// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class QuoteEntity extends Equatable {
  final List<double> open;

  const QuoteEntity({required this.open});

  @override
  List<Object?> get props => [open];
}
