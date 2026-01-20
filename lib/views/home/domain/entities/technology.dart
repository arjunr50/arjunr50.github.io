import 'package:freezed_annotation/freezed_annotation.dart';

part 'auto/technology.freezed.dart';
part 'auto/technology.g.dart';

@freezed
sealed class Technology with _$Technology {
  const factory Technology({
    @JsonKey(name: '_id') required String id,
    required String name,
    required String icon,
    required String category,
  }) = _Technology;

  factory Technology.fromJson(Map<String, dynamic> json) => _$TechnologyFromJson(json);
}
