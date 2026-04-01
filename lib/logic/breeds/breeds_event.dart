import 'package:equatable/equatable.dart';

abstract class BreedsEvent extends Equatable {
  const BreedsEvent();

  @override
  List<Object?> get props => [];
}

/// Load initial breeds (page 1) - can use cache
class LoadInitialBreeds extends BreedsEvent {
  const LoadInitialBreeds();
}

/// Load more breeds for infinite scroll
class LoadMoreBreeds extends BreedsEvent {
  const LoadMoreBreeds();
}

/// Refresh breeds (pull to refresh)
class RefreshBreeds extends BreedsEvent {
  const RefreshBreeds();
}

/// Filter breeds by search query (local filtering)
class FilterBreeds extends BreedsEvent {
  final String query;

  const FilterBreeds(this.query);

  @override
  List<Object?> get props => [query];
}
