// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'breed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Breed _$BreedFromJson(Map<String, dynamic> json) {
  return _Breed.fromJson(json);
}

/// @nodoc
mixin _$Breed {
  String get breed => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  String get origin => throw _privateConstructorUsedError;
  String get coat => throw _privateConstructorUsedError;
  String get pattern => throw _privateConstructorUsedError;

  /// Serializes this Breed to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Breed
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BreedCopyWith<Breed> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BreedCopyWith<$Res> {
  factory $BreedCopyWith(Breed value, $Res Function(Breed) then) =
      _$BreedCopyWithImpl<$Res, Breed>;
  @useResult
  $Res call({
    String breed,
    String country,
    String origin,
    String coat,
    String pattern,
  });
}

/// @nodoc
class _$BreedCopyWithImpl<$Res, $Val extends Breed>
    implements $BreedCopyWith<$Res> {
  _$BreedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Breed
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? breed = null,
    Object? country = null,
    Object? origin = null,
    Object? coat = null,
    Object? pattern = null,
  }) {
    return _then(
      _value.copyWith(
            breed: null == breed
                ? _value.breed
                : breed // ignore: cast_nullable_to_non_nullable
                      as String,
            country: null == country
                ? _value.country
                : country // ignore: cast_nullable_to_non_nullable
                      as String,
            origin: null == origin
                ? _value.origin
                : origin // ignore: cast_nullable_to_non_nullable
                      as String,
            coat: null == coat
                ? _value.coat
                : coat // ignore: cast_nullable_to_non_nullable
                      as String,
            pattern: null == pattern
                ? _value.pattern
                : pattern // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BreedImplCopyWith<$Res> implements $BreedCopyWith<$Res> {
  factory _$$BreedImplCopyWith(
    _$BreedImpl value,
    $Res Function(_$BreedImpl) then,
  ) = __$$BreedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String breed,
    String country,
    String origin,
    String coat,
    String pattern,
  });
}

/// @nodoc
class __$$BreedImplCopyWithImpl<$Res>
    extends _$BreedCopyWithImpl<$Res, _$BreedImpl>
    implements _$$BreedImplCopyWith<$Res> {
  __$$BreedImplCopyWithImpl(
    _$BreedImpl _value,
    $Res Function(_$BreedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Breed
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? breed = null,
    Object? country = null,
    Object? origin = null,
    Object? coat = null,
    Object? pattern = null,
  }) {
    return _then(
      _$BreedImpl(
        breed: null == breed
            ? _value.breed
            : breed // ignore: cast_nullable_to_non_nullable
                  as String,
        country: null == country
            ? _value.country
            : country // ignore: cast_nullable_to_non_nullable
                  as String,
        origin: null == origin
            ? _value.origin
            : origin // ignore: cast_nullable_to_non_nullable
                  as String,
        coat: null == coat
            ? _value.coat
            : coat // ignore: cast_nullable_to_non_nullable
                  as String,
        pattern: null == pattern
            ? _value.pattern
            : pattern // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BreedImpl implements _Breed {
  const _$BreedImpl({
    required this.breed,
    required this.country,
    required this.origin,
    required this.coat,
    required this.pattern,
  });

  factory _$BreedImpl.fromJson(Map<String, dynamic> json) =>
      _$$BreedImplFromJson(json);

  @override
  final String breed;
  @override
  final String country;
  @override
  final String origin;
  @override
  final String coat;
  @override
  final String pattern;

  @override
  String toString() {
    return 'Breed(breed: $breed, country: $country, origin: $origin, coat: $coat, pattern: $pattern)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BreedImpl &&
            (identical(other.breed, breed) || other.breed == breed) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.coat, coat) || other.coat == coat) &&
            (identical(other.pattern, pattern) || other.pattern == pattern));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, breed, country, origin, coat, pattern);

  /// Create a copy of Breed
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BreedImplCopyWith<_$BreedImpl> get copyWith =>
      __$$BreedImplCopyWithImpl<_$BreedImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BreedImplToJson(this);
  }
}

abstract class _Breed implements Breed {
  const factory _Breed({
    required final String breed,
    required final String country,
    required final String origin,
    required final String coat,
    required final String pattern,
  }) = _$BreedImpl;

  factory _Breed.fromJson(Map<String, dynamic> json) = _$BreedImpl.fromJson;

  @override
  String get breed;
  @override
  String get country;
  @override
  String get origin;
  @override
  String get coat;
  @override
  String get pattern;

  /// Create a copy of Breed
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BreedImplCopyWith<_$BreedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BreedsResponse _$BreedsResponseFromJson(Map<String, dynamic> json) {
  return _BreedsResponse.fromJson(json);
}

/// @nodoc
mixin _$BreedsResponse {
  @JsonKey(name: 'current_page')
  int get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  List<Breed> get breeds => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_page')
  int get lastPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_page')
  int get perPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'total')
  int get total => throw _privateConstructorUsedError;

  /// Serializes this BreedsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BreedsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BreedsResponseCopyWith<BreedsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BreedsResponseCopyWith<$Res> {
  factory $BreedsResponseCopyWith(
    BreedsResponse value,
    $Res Function(BreedsResponse) then,
  ) = _$BreedsResponseCopyWithImpl<$Res, BreedsResponse>;
  @useResult
  $Res call({
    @JsonKey(name: 'current_page') int currentPage,
    @JsonKey(name: 'data') List<Breed> breeds,
    @JsonKey(name: 'last_page') int lastPage,
    @JsonKey(name: 'per_page') int perPage,
    @JsonKey(name: 'total') int total,
  });
}

/// @nodoc
class _$BreedsResponseCopyWithImpl<$Res, $Val extends BreedsResponse>
    implements $BreedsResponseCopyWith<$Res> {
  _$BreedsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BreedsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? breeds = null,
    Object? lastPage = null,
    Object? perPage = null,
    Object? total = null,
  }) {
    return _then(
      _value.copyWith(
            currentPage: null == currentPage
                ? _value.currentPage
                : currentPage // ignore: cast_nullable_to_non_nullable
                      as int,
            breeds: null == breeds
                ? _value.breeds
                : breeds // ignore: cast_nullable_to_non_nullable
                      as List<Breed>,
            lastPage: null == lastPage
                ? _value.lastPage
                : lastPage // ignore: cast_nullable_to_non_nullable
                      as int,
            perPage: null == perPage
                ? _value.perPage
                : perPage // ignore: cast_nullable_to_non_nullable
                      as int,
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BreedsResponseImplCopyWith<$Res>
    implements $BreedsResponseCopyWith<$Res> {
  factory _$$BreedsResponseImplCopyWith(
    _$BreedsResponseImpl value,
    $Res Function(_$BreedsResponseImpl) then,
  ) = __$$BreedsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'current_page') int currentPage,
    @JsonKey(name: 'data') List<Breed> breeds,
    @JsonKey(name: 'last_page') int lastPage,
    @JsonKey(name: 'per_page') int perPage,
    @JsonKey(name: 'total') int total,
  });
}

/// @nodoc
class __$$BreedsResponseImplCopyWithImpl<$Res>
    extends _$BreedsResponseCopyWithImpl<$Res, _$BreedsResponseImpl>
    implements _$$BreedsResponseImplCopyWith<$Res> {
  __$$BreedsResponseImplCopyWithImpl(
    _$BreedsResponseImpl _value,
    $Res Function(_$BreedsResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BreedsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? breeds = null,
    Object? lastPage = null,
    Object? perPage = null,
    Object? total = null,
  }) {
    return _then(
      _$BreedsResponseImpl(
        currentPage: null == currentPage
            ? _value.currentPage
            : currentPage // ignore: cast_nullable_to_non_nullable
                  as int,
        breeds: null == breeds
            ? _value._breeds
            : breeds // ignore: cast_nullable_to_non_nullable
                  as List<Breed>,
        lastPage: null == lastPage
            ? _value.lastPage
            : lastPage // ignore: cast_nullable_to_non_nullable
                  as int,
        perPage: null == perPage
            ? _value.perPage
            : perPage // ignore: cast_nullable_to_non_nullable
                  as int,
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BreedsResponseImpl implements _BreedsResponse {
  const _$BreedsResponseImpl({
    @JsonKey(name: 'current_page') required this.currentPage,
    @JsonKey(name: 'data') required final List<Breed> breeds,
    @JsonKey(name: 'last_page') required this.lastPage,
    @JsonKey(name: 'per_page') required this.perPage,
    @JsonKey(name: 'total') required this.total,
  }) : _breeds = breeds;

  factory _$BreedsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BreedsResponseImplFromJson(json);

  @override
  @JsonKey(name: 'current_page')
  final int currentPage;
  final List<Breed> _breeds;
  @override
  @JsonKey(name: 'data')
  List<Breed> get breeds {
    if (_breeds is EqualUnmodifiableListView) return _breeds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_breeds);
  }

  @override
  @JsonKey(name: 'last_page')
  final int lastPage;
  @override
  @JsonKey(name: 'per_page')
  final int perPage;
  @override
  @JsonKey(name: 'total')
  final int total;

  @override
  String toString() {
    return 'BreedsResponse(currentPage: $currentPage, breeds: $breeds, lastPage: $lastPage, perPage: $perPage, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BreedsResponseImpl &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            const DeepCollectionEquality().equals(other._breeds, _breeds) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    currentPage,
    const DeepCollectionEquality().hash(_breeds),
    lastPage,
    perPage,
    total,
  );

  /// Create a copy of BreedsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BreedsResponseImplCopyWith<_$BreedsResponseImpl> get copyWith =>
      __$$BreedsResponseImplCopyWithImpl<_$BreedsResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BreedsResponseImplToJson(this);
  }
}

abstract class _BreedsResponse implements BreedsResponse {
  const factory _BreedsResponse({
    @JsonKey(name: 'current_page') required final int currentPage,
    @JsonKey(name: 'data') required final List<Breed> breeds,
    @JsonKey(name: 'last_page') required final int lastPage,
    @JsonKey(name: 'per_page') required final int perPage,
    @JsonKey(name: 'total') required final int total,
  }) = _$BreedsResponseImpl;

  factory _BreedsResponse.fromJson(Map<String, dynamic> json) =
      _$BreedsResponseImpl.fromJson;

  @override
  @JsonKey(name: 'current_page')
  int get currentPage;
  @override
  @JsonKey(name: 'data')
  List<Breed> get breeds;
  @override
  @JsonKey(name: 'last_page')
  int get lastPage;
  @override
  @JsonKey(name: 'per_page')
  int get perPage;
  @override
  @JsonKey(name: 'total')
  int get total;

  /// Create a copy of BreedsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BreedsResponseImplCopyWith<_$BreedsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
