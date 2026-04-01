import 'package:freezed_annotation/freezed_annotation.dart';

part 'fact.freezed.dart';
part 'fact.g.dart';

@freezed
class Fact with _$Fact {
  const factory Fact({
    required String fact,
    required int length,
  }) = _Fact;

  factory Fact.fromJson(Map<String, dynamic> json) => _$FactFromJson(json);
}
