import 'package:flutter/material.dart';
import 'package:test_riverpod/common/constant/app_colors.dart';

abstract class AppTextStyles {
  static const littleAddress = TextStyle(
    fontSize: 12,
    height: 1.3,
    color: AppColors.black50,
  );
  static const little = TextStyle(
    fontSize: 14,
    height: 1.43,
    color: AppColors.black50,
  );
  static const p = TextStyle(
    fontSize: 15,
    height: 1.46,
    color: AppColors.black50,
  );
  static const lable = TextStyle(
    fontSize: 15,
    height: 1.3,
    color: AppColors.black,
  );
  static const button = TextStyle(
    fontSize: 16,
    height: 1.375,
    color: AppColors.black,
    fontWeight: FontWeight.w500,
  );
  static const h3 = TextStyle(
    fontSize: 18,
    height: 1.3,
    color: AppColors.black,
    fontWeight: FontWeight.w600,
  );
  static const h2 = TextStyle(
    fontSize: 20,
    height: 1.3,
    color: AppColors.black,
    fontWeight: FontWeight.w600,
  );
}
