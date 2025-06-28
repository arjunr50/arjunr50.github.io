import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_colors.dart';

class GradientStyles {
  // Dark Theme Gradients
  static const LinearGradient darkHeroGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      AppColors.darkPrimary,
      AppColors.darkSecondary,

    ],
  );

  static const LinearGradient darkAboutGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.darkSurface,
      AppColors.darkBackground,
    ],
  );

  static const LinearGradient darkProjectsGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.darkBackground,
      AppColors.darkPrimary,
    ],
  );

  static const LinearGradient darkProjectsGradientInverse = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [
      AppColors.darkBackground,
      AppColors.darkPrimary,
    ],
  );

  // Light Theme Gradients
  static const LinearGradient lightHeroGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xffdda15e),
      Color(0xfffefae0),
      ]
  );

  static const LinearGradient lightAboutGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.lightSurface,
      AppColors.lightBackground,
    ],
  );

  static const LinearGradient lightProjectsGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.lightBackground,
      AppColors.lightSurface,
    ],
  );
}
