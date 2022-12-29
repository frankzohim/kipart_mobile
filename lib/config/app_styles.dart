import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ki_part/config/app_colors.dart';

mixin AppStyles {
  static final ligth = ThemeData.light().copyWith(
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(),
      scaffoldBackgroundColor: AppColors.scaffoldBgLight,
      canvasColor: AppColors.canvasBgLight,
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(const Size(300, 40)))),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 64, vertical: 16)),
              backgroundColor: MaterialStateProperty.all(AppColors.primary))),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey.shade300,
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        prefixIconColor: AppColors.primary,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none),
      ));
  static final dark = ThemeData.dark().copyWith(
      colorScheme: const ColorScheme.dark(
          primary: AppColors.primary,
          secondary: AppColors.accent,
          tertiary: AppColors.secondary),
      appBarTheme: const AppBarTheme(backgroundColor: AppColors.primary),
      textTheme:
          GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme).copyWith(),
      scaffoldBackgroundColor: AppColors.scaffoldBgDark,
      canvasColor: AppColors.canvasBgDark,
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(const Size(300, 40)))),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(const Size(300, 40)),
              backgroundColor: MaterialStateProperty.all(AppColors.primary))),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color.fromARGB(255, 9, 4, 14),
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        prefixIconColor: AppColors.primary,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none),
      ));
}
