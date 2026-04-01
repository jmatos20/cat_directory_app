import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constants.dart';
import '../../data/models/breed.dart';
import '../../data/repositories/cat_repository.dart';
import '../../data/services/cache_service.dart';
import 'breeds_event.dart';
import 'breeds_state.dart';

class BreedsBloc extends Bloc<BreedsEvent, BreedsState> {
  final CatRepository _repository;
  final CacheService _cacheService;

  BreedsBloc({
    required CatRepository repository,
    required CacheService cacheService,
  })  : _repository = repository,
        _cacheService = cacheService,
        super(const BreedsState()) {
    on<LoadInitialBreeds>(_onLoadInitialBreeds, transformer: droppable());
    on<LoadMoreBreeds>(_onLoadMoreBreeds, transformer: droppable());
    on<RefreshBreeds>(_onRefreshBreeds, transformer: droppable());
    on<FilterBreeds>(_onFilterBreeds);
  }

  Future<void> _onLoadInitialBreeds(
    LoadInitialBreeds event,
    Emitter<BreedsState> emit,
  ) async {
    emit(state.copyWith(status: BreedsStatus.loading));

    final cachedResponse = await _cacheService.getCachedFirstPageBreeds();
    if (cachedResponse != null) {
      emit(state.copyWith(
        status: BreedsStatus.success,
        breeds: cachedResponse.breeds,
        filteredBreeds: cachedResponse.breeds,
        currentPage: cachedResponse.currentPage,
        lastPage: cachedResponse.lastPage,
        hasReachedMax: cachedResponse.currentPage >= cachedResponse.lastPage,
        isFromCache: true,
      ));
      await _loadFreshData(emit);
      return;
    }

    await _loadFreshData(emit);
  }

  Future<void> _loadFreshData(Emitter<BreedsState> emit) async {
    final result = await _repository.getBreeds(page: ApiConstants.firstPage);

    final failure = result.fold((f) => f, (_) => null);
    if (failure != null) {
      emit(state.copyWith(
        status: BreedsStatus.failure,
        errorMessage: failure.message,
        isFromCache: false,
      ));
      return;
    }

    final response = result.fold((_) => null, (r) => r)!;
    await _cacheService.cacheFirstPageBreeds(response);
    emit(state.copyWith(
      status: BreedsStatus.success,
      breeds: response.breeds,
      filteredBreeds: response.breeds,
      currentPage: response.currentPage,
      lastPage: response.lastPage,
      hasReachedMax: response.currentPage >= response.lastPage,
      isFromCache: false,
    ));
  }

  Future<void> _onLoadMoreBreeds(
    LoadMoreBreeds event,
    Emitter<BreedsState> emit,
  ) async {
    if (state.hasReachedMax) return;
    if (state.status == BreedsStatus.loadingMore) return;

    emit(state.copyWith(status: BreedsStatus.loadingMore));

    final nextPage = state.currentPage + 1;
    final result = await _repository.getBreeds(page: nextPage);

    result.fold(
      (failure) {
        emit(state.copyWith(
          status: BreedsStatus.failure,
          errorMessage: failure.message,
        ));
      },
      (response) {
        final updatedBreeds = List<Breed>.from(state.breeds)
          ..addAll(response.breeds);

        emit(state.copyWith(
          status: BreedsStatus.success,
          breeds: updatedBreeds,
          filteredBreeds: state.searchQuery.isEmpty
              ? updatedBreeds
              : _filterBreeds(updatedBreeds, state.searchQuery),
          currentPage: response.currentPage,
          lastPage: response.lastPage,
          hasReachedMax: response.currentPage >= response.lastPage,
          errorMessage: null,
        ));
      },
    );
  }

  Future<void> _onRefreshBreeds(
    RefreshBreeds event,
    Emitter<BreedsState> emit,
  ) async {
    emit(const BreedsState(status: BreedsStatus.loading));

    final result = await _repository.getBreeds(page: ApiConstants.firstPage);

    final failure = result.fold((f) => f, (_) => null);
    if (failure != null) {
      emit(state.copyWith(
        status: BreedsStatus.failure,
        errorMessage: failure.message,
      ));
      return;
    }

    final response = result.fold((_) => null, (r) => r)!;
    await _cacheService.cacheFirstPageBreeds(response);
    emit(state.copyWith(
      status: BreedsStatus.success,
      breeds: response.breeds,
      filteredBreeds: response.breeds,
      currentPage: response.currentPage,
      lastPage: response.lastPage,
      hasReachedMax: response.currentPage >= response.lastPage,
      searchQuery: '',
      errorMessage: null,
    ));
  }

  void _onFilterBreeds(
    FilterBreeds event,
    Emitter<BreedsState> emit,
  ) {
    final query = event.query.toLowerCase();
    final filtered = query.isEmpty
        ? state.breeds
        : _filterBreeds(state.breeds, query);

    emit(state.copyWith(
      filteredBreeds: filtered,
      searchQuery: query,
    ));
  }

  List<Breed> _filterBreeds(List<Breed> breeds, String query) {
    return breeds
        .where((breed) => breed.breed.toLowerCase().contains(query))
        .toList();
  }
}
