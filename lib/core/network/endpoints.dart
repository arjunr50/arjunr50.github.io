import 'package:portfolio/core/constants/constant.dart';

enum EndPoint { portfolio, personal, projects, technologies }

extension UrlExtension on EndPoint {
  String get url {
    switch (this) {
      case EndPoint.portfolio:
        return '$baseUrl/portfolio';
      case EndPoint.personal:
        return '$baseUrl/portfolio/personal';
      case EndPoint.technologies:
        return '$baseUrl/portfolio/personal';
      case EndPoint.projects:
        return '$baseUrl/portfolio/projects';
    }
  }
}

extension RequestMode on EndPoint {
  RequestType get requestType {
    switch (this) {
      case EndPoint.portfolio:
      case EndPoint.personal:
      case EndPoint.technologies:
      case EndPoint.projects:
        return RequestType.get;
      }
  }
}

enum RequestType { get, post, put, patch, delete }
