import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_theme.dart';
import 'package:portfolio/core/routes/router.dart';
import 'package:provider/provider.dart';
import 'core/constants/menu.dart';
import 'core/di/injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return AnimatedBuilder(
        animation: themeNotifier,
        builder: (context, _) {
          return MaterialApp.router(
            scaffoldMessengerKey: snackBarKey,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeNotifier.currentTheme.brightness == Brightness.dark
                ? ThemeMode.dark
                : ThemeMode.light,
            routerDelegate: router.routerDelegate,
            routeInformationParser: router.routeInformationParser,
            routeInformationProvider: router.routeInformationProvider,
          );
        });
  }
}
