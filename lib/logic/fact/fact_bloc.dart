import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constants.dart';
import '../../data/repositories/cat_repository.dart';
import 'fact_event.dart';
import 'fact_state.dart';

class FactBloc extends Bloc<FactEvent, FactState> {
  final CatRepository _repository;

  FactBloc({
    required CatRepository repository,
  })  : _repository = repository,
        super(const FactState()) {
    on<LoadRandomFact>(_onLoadRandomFact);
  }

  Future<void> _onLoadRandomFact(
    LoadRandomFact event,
    Emitter<FactState> emit,
  ) async {
    emit(state.copyWith(status: FactStatus.loading, isTimeout: false));

    try {
      final result = await _repository
          .getRandomFact()
          .timeout(ApiConstants.factRequestTimeout);

      result.fold(
        (failure) {
          emit(state.copyWith(
            status: FactStatus.failure,
            errorMessage: failure.message,
            isTimeout: false,
          ));
        },
        (fact) {
          emit(state.copyWith(
            status: FactStatus.success,
            fact: fact,
            errorMessage: null,
            isTimeout: false,
          ));
        },
      );
    } on TimeoutException {
      emit(state.copyWith(
        status: FactStatus.failure,
        errorMessage: 'La consulta tardó demasiado. Verifica tu conexión e intenta de nuevo.',
        isTimeout: true,
      ));
    }
  }
}
