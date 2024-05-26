import 'package:clario_test/src/core/resources/resources.dart';
import 'package:flutter/material.dart';

sealed class AppThemes {
  AppThemes._();
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        onError: AppColors.errorColor,
        seedColor: Colors.blue,
      ),
      useMaterial3: false,
      appBarTheme: const AppBarTheme(elevation: 0),
      textTheme: const TextTheme(
        titleLarge: AppTextStyles.titleLargeStyle,
      ),
    );
  }
}
