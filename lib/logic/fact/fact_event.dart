import 'package:equatable/equatable.dart';

abstract class FactEvent extends Equatable {
  const FactEvent();

  @override
  List<Object?> get props => [];
}

/// Load a random cat fact
class LoadRandomFact extends FactEvent {
  const LoadRandomFact();
}
