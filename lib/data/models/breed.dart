import 'package:freezed_annotation/freezed_annotation.dart';

part 'breed.freezed.dart';
part 'breed.g.dart';

@freezed
class Breed with _$Breed {
  const factory Breed({
    required String breed,
    required String country,
    required String origin,
    required String coat,
    required String pattern,
  }) = _Breed;

  factory Breed.fromJson(Map<String, dynamic> json) => _$BreedFromJson(json);
}

@freezed
class BreedsResponse with _$BreedsResponse {
  const factory BreedsResponse({
    @JsonKey(name: 'current_page') required int currentPage,
    @JsonKey(name: 'data') required List<Breed> breeds,
    @JsonKey(name: 'last_page') required int lastPage,
    @JsonKey(name: 'per_page') required int perPage,
    @JsonKey(name: 'total') required int total,
  }) = _BreedsResponse;

  factory BreedsResponse.fromJson(Map<String, dynamic> json) =>
      _$BreedsResponseFromJson(json);
}
