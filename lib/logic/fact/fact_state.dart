import 'package:equatable/equatable.dart';
import '../../data/models/fact.dart';

enum FactStatus {
  initial,
  loading,
  success,
  failure,
}

class FactState extends Equatable {
  final FactStatus status;
  final Fact? fact;
  final String? errorMessage;
  final bool isTimeout;

  const FactState({
    this.status = FactStatus.initial,
    this.fact,
    this.errorMessage,
    this.isTimeout = false,
  });

  FactState copyWith({
    FactStatus? status,
    Fact? fact,
    String? errorMessage,
    bool? isTimeout,
  }) {
    return FactState(
      status: status ?? this.status,
      fact: fact ?? this.fact,
      errorMessage: errorMessage,
      isTimeout: isTimeout ?? this.isTimeout,
    );
  }

  @override
  List<Object?> get props => [status, fact, errorMessage, isTimeout];
}
