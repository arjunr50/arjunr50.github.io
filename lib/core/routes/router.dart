import 'package:go_router/go_router.dart';
import 'package:portfolio/core/routes/route_names.dart';
import 'package:portfolio/views/home_page.dart';
import 'package:portfolio/views/privacy_policy/todo_privacy_policy.dart';


final GoRouter router = GoRouter(
  observers: [],
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return HomePage();
      },
    ),
    GoRoute(
      path: RouteNames.tudu.path,
      builder: (context, state) {
        return TuduPrivacyPolicy();
      },
    ),
  ],
);
