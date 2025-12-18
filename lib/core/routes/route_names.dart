enum RouteNames { home, tudu }

extension RouteNamesExtension on RouteNames {
  String get name => switch (this) {
        RouteNames.home => 'home',
        RouteNames.tudu => 'tudu-privacy-policy',
      };

  String get path => switch (this) {
        RouteNames.home => '/home',
        RouteNames.tudu => '/tudu-privacy-policy',
      };
}
