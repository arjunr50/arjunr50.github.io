import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:portfolio/views/home/domain/entities/personal.dart';
import 'package:portfolio/views/home/domain/entities/project.dart';
import 'package:portfolio/views/home/domain/entities/technology.dart';

part 'auto/portfolio_response.freezed.dart';
part 'auto/portfolio_response.g.dart';

@freezed
sealed class PortfolioResponse with _$PortfolioResponse {
  const factory PortfolioResponse({
    required Personal personal,
    required List<Project> projects,
    required List<Technology> technology,
  }) = _PortfolioResponse;

  factory PortfolioResponse.fromJson(Map<String, dynamic> json) =>
      _$PortfolioResponseFromJson(json);
}
