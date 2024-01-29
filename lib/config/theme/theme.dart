import 'package:doctor_appointment_client/constants/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
    fontFamily: 'Roboto',
    appBarTheme: const AppBarTheme(
        centerTitle: true,
        titleTextStyle: TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold)),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)))),
    textTheme: const TextTheme(
        headlineMedium: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        headlineSmall: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
        bodySmall: TextStyle(
            color: AppColors.gray_2,
            fontWeight: FontWeight.w400,
            fontSize: 12)),
  );
}




// AppBarTheme appBarTheme() {
//   return const AppBarTheme(
//     color: Colors.white,
//     elevation: 0,
//     centerTitle: true,
//     iconTheme: IconThemeData(color: Color(0XFF8B8B8B)),
//     titleTextStyle: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
//   );
// }