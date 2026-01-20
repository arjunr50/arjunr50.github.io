import 'package:freezed_annotation/freezed_annotation.dart';

part 'auto/personal.freezed.dart';
part 'auto/personal.g.dart';

@freezed
sealed class Personal with _$Personal {
  const factory Personal({
    @JsonKey(name: '_id') required String id,
    required String name,
    @Default([]) List<String> title,
    @Default('') String about,
    @Default('') String description,
    @JsonKey(name: 'no_of_projects') @Default(0) int noOfProjects,
    @Default('') String phone,
    @Default('') String email,
    @Default([]) List<String> location,
    @Default(0.0) double exp,
    @Default('') String contact,
    @Default('') String linkedin,
    @Default('') String github,
  }) = _Personal;

  factory Personal.fromJson(Map<String, dynamic> json) => _$PersonalFromJson(json);
}
