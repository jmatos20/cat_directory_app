// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BreedImpl _$$BreedImplFromJson(Map<String, dynamic> json) => _$BreedImpl(
  breed: json['breed'] as String,
  country: json['country'] as String,
  origin: json['origin'] as String,
  coat: json['coat'] as String,
  pattern: json['pattern'] as String,
);

Map<String, dynamic> _$$BreedImplToJson(_$BreedImpl instance) =>
    <String, dynamic>{
      'breed': instance.breed,
      'country': instance.country,
      'origin': instance.origin,
      'coat': instance.coat,
      'pattern': instance.pattern,
    };

_$BreedsResponseImpl _$$BreedsResponseImplFromJson(Map<String, dynamic> json) =>
    _$BreedsResponseImpl(
      currentPage: (json['current_page'] as num).toInt(),
      breeds: (json['data'] as List<dynamic>)
          .map((e) => Breed.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastPage: (json['last_page'] as num).toInt(),
      perPage: (json['per_page'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$$BreedsResponseImplToJson(
  _$BreedsResponseImpl instance,
) => <String, dynamic>{
  'current_page': instance.currentPage,
  'data': instance.breeds,
  'last_page': instance.lastPage,
  'per_page': instance.perPage,
  'total': instance.total,
};
