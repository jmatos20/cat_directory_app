import 'package:equatable/equatable.dart';
import '../../data/models/breed.dart';

enum BreedsStatus {
  initial,
  loading,
  loadingMore,
  success,
  failure,
}

class BreedsState extends Equatable {
  final BreedsStatus status;
  final List<Breed> breeds;
  final List<Breed> filteredBreeds;
  final String searchQuery;
  final int currentPage;
  final int lastPage;
  final bool hasReachedMax;
  final String? errorMessage;
  final bool isFromCache;

  const BreedsState({
    this.status = BreedsStatus.initial,
    this.breeds = const [],
    this.filteredBreeds = const [],
    this.searchQuery = '',
    this.currentPage = 0,
    this.lastPage = 1,
    this.hasReachedMax = false,
    this.errorMessage,
    this.isFromCache = false,
  });

  BreedsState copyWith({
    BreedsStatus? status,
    List<Breed>? breeds,
    List<Breed>? filteredBreeds,
    String? searchQuery,
    int? currentPage,
    int? lastPage,
    bool? hasReachedMax,
    String? errorMessage,
    bool? isFromCache,
  }) {
    return BreedsState(
      status: status ?? this.status,
      breeds: breeds ?? this.breeds,
      filteredBreeds: filteredBreeds ?? this.filteredBreeds,
      searchQuery: searchQuery ?? this.searchQuery,
      currentPage: currentPage ?? this.currentPage,
      lastPage: lastPage ?? this.lastPage,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      errorMessage: errorMessage,
      isFromCache: isFromCache ?? this.isFromCache,
    );
  }

  @override
  List<Object?> get props => [
        status,
        breeds,
        filteredBreeds,
        searchQuery,
        currentPage,
        lastPage,
        hasReachedMax,
        errorMessage,
        isFromCache,
      ];
}
