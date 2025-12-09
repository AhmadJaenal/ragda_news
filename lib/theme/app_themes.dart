import 'package:flutter/material.dart';

import '../core/constans/app_colors.dart';

extension AppThemeExtension on BuildContext {
  ThemeData get lightTheme => ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    appBarTheme: AppBarTheme(backgroundColor: AppColors.primary, elevation: 0),
    textTheme: const TextTheme().apply(
      bodyColor: AppColors.primaryTextColor,
      displayColor: AppColors.primaryTextColor,
    ),
  );
}
