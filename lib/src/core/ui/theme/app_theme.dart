import 'package:flutter/material.dart';
import 'package:taalim/src/core/ui/theme/app_colors.dart';


ThemeData getAppTheme() => ThemeData(
      useMaterial3: true,
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
          fontFamily: 'NunitoSans',
          fontWeight: FontWeight.w400,
          fontSize: 16,
          height: 1.25,
          color: AppColors.black,
        ),
        bodySmall: TextStyle(
          fontFamily: 'NunitoSans',
          fontWeight: FontWeight.w400,
          fontSize: 14,
          height: 1.3,
          color: AppColors.black,
        ),
        titleLarge: TextStyle(
          fontFamily: 'NunitoSans',
          fontWeight: FontWeight.w600,
          fontSize: 24,
          height: 1.17,
          color: AppColors.black,
        ),
        titleMedium: TextStyle(
          fontFamily: 'NunitoSans',
          fontWeight: FontWeight.w600,
          fontSize: 16,
          height: 1.25,
          color: AppColors.black,
        ),
        titleSmall: TextStyle(
          fontFamily: 'NunitoSans',
          fontWeight: FontWeight.w500,
          fontSize: 14,
          height: 1.3,
          color: AppColors.black,
        ),
        labelLarge: TextStyle(
          fontFamily: 'NunitoSans',
          fontWeight: FontWeight.w600,
          fontSize: 18,
          height: 1.2,
          color: AppColors.black,
        ),
        labelMedium: TextStyle(
          fontFamily: 'NunitoSans',
          fontWeight: FontWeight.w500,
          fontSize: 16,
          height: 1.25,
          color: AppColors.white,
        ),
      ),
    );
