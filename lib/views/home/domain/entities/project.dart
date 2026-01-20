import 'package:freezed_annotation/freezed_annotation.dart';

part 'auto/project.freezed.dart';
part 'auto/project.g.dart';

@freezed
sealed class Project with _$Project {
  factory Project({
    @JsonKey(name: '_id') required String id,
    required String title,
    required String description,
    @Default([]) List<String> image,
    @Default('') String url,
    @JsonKey(name: 'tech_stack') @Default([]) List<String> techStack,
    @Default('') String category,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) => _$ProjectFromJson(json);
}
