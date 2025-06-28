import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_theme.dart';
import 'package:portfolio/views/home_page.dart';
import 'package:provider/provider.dart';
import 'core/constants/menu.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
          return MaterialApp(
            scaffoldMessengerKey: snackBarKey,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeNotifier.currentTheme.brightness == Brightness.dark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: HomePage(),
          );
        });
  }
}
