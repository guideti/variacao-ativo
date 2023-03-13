import 'package:equatable/equatable.dart';

class ActiveEntity extends Equatable {
  final List<double?> quote;

  const ActiveEntity({required this.quote});
  @override
  List<Object?> get props => [quote];
}
