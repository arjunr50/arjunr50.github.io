import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_colors.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    useMaterial3: true,
    primaryColor: AppColors.darkPrimary,
    scaffoldBackgroundColor: AppColors.darkBackground,
    cardColor: AppColors.darkCard,
    canvasColor: AppColors.darkSurface,
    dividerColor: AppColors.darkBorder,

    // Color Scheme
    colorScheme: const ColorScheme.dark(
      brightness: Brightness.dark,
      primary: AppColors.darkPrimary,
      onPrimary: AppColors.darkText,
      secondary: AppColors.darkSecondary,
      onSecondary: AppColors.darkText,
      surface: AppColors.darkSurface,
      onSurface: AppColors.darkText,
      error: Color(0xFFf87171),
      onError: AppColors.darkText,
      outline: AppColors.darkBorder,
    ),
  );

  static final ThemeData lightTheme = ThemeData(
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    useMaterial3: true,
    primaryColor: AppColors.lightPrimary,
    scaffoldBackgroundColor: AppColors.lightBackground,
    cardColor: AppColors.lightCard,
    canvasColor: AppColors.lightSurface,
    dividerColor: AppColors.lightBorder,

    // Color Scheme
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      primary: AppColors.lightPrimary,
      onPrimary: Colors.white,
      secondary: AppColors.lightSecondary,
      onSecondary: Colors.white,
      surface: AppColors.lightSurface,
      onSurface: AppColors.lightText,
    ),
  );
}

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = AppTheme.lightTheme;

  ThemeData get currentTheme => _currentTheme;

  void toggleTheme() {
    _currentTheme = _currentTheme == AppTheme.darkTheme
        ? AppTheme.lightTheme
        : AppTheme.darkTheme;

    notifyListeners();
  }
}
