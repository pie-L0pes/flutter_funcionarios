import 'package:flutter/material.dart';
import 'pallet.dart';

abstract class AppTheme {
  static ThemeData appTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Pallet.p1,
    appBarTheme: const AppBarTheme(
      backgroundColor: Pallet.p4,
      foregroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        color: Pallet.p4,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        color: Pallet.p4,
        fontSize: 14,
      ),
      labelMedium: TextStyle(
        color: Pallet.p4,
        fontSize: 16,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: const WidgetStatePropertyAll(Colors.white),
        backgroundColor: WidgetStateProperty.fromMap({
          WidgetState.pressed: Pallet.p4,
          WidgetState.hovered: Pallet.p2,
          WidgetState.disabled: Pallet.t1,
          WidgetState.any: Pallet.p3,
        }),
        elevation: const WidgetStatePropertyAll(8),
      ),
    ),
    canvasColor: Pallet.p2,
  );
}