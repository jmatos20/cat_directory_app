import 'package:equatable/equatable.dart';

abstract class BreedsEvent extends Equatable {
  const BreedsEvent();

  @override
  List<Object?> get props => [];
}

class LoadInitialBreeds extends BreedsEvent {
  const LoadInitialBreeds();
}

class LoadMoreBreeds extends BreedsEvent {
  const LoadMoreBreeds();
}

class RefreshBreeds extends BreedsEvent {
  const RefreshBreeds();
}

class FilterBreeds extends BreedsEvent {
  final String query;

  const FilterBreeds(this.query);

  @override
  List<Object?> get props => [query];
}
