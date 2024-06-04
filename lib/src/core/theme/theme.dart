import 'package:flutter/material.dart';
import 'package:motasimfuad_wedevs/src/core/theme/colors.dart';

ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: AppColors.pageBackground,
  appBarTheme: const AppBarTheme(
    color: AppColors.pageBackground,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 22,
      fontWeight: FontWeight.w700,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
);
