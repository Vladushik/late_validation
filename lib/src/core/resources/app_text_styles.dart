// ignore_for_file: unused_field

import 'package:clario_test/src/core/resources/app_colors.dart';
import 'package:flutter/material.dart';

abstract final class AppTextStyles {
  AppTextStyles._();

  /// Sizes
  static const double _size28 = 28;
  static const double _size16 = 16;

  /// Weight
  static const FontWeight _bold = FontWeight.w700;
  static const FontWeight _semiBold = FontWeight.w600;
  static const FontWeight _medium = FontWeight.w500;
  static const FontWeight _regular = FontWeight.w400;

  /// TextStyles
  static const TextStyle titleLargeStyle = TextStyle(
    fontWeight: _bold,
    fontSize: _size28,
    color: AppColors.textTitleColor,
  );

  static const TextStyle buttonTitleStyle = TextStyle(
    fontWeight: _bold,
    fontSize: _size16,
    color: AppColors.white,
  );
}
