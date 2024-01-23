import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../generated/theme/theme_provider.g.dart';

@riverpod
ThemeData lightTheme(LightThemeRef ref) {
  final baseTheme = _createBaseTheme(Brightness.light);

  return baseTheme.copyWith(
    textTheme: GoogleFonts.robotoTextTheme(baseTheme.textTheme),
  );
}

@riverpod
ThemeData darkTheme(DarkThemeRef ref) {
  final baseTheme = _createBaseTheme(Brightness.dark);

  return baseTheme.copyWith(
    textTheme: GoogleFonts.robotoTextTheme(baseTheme.textTheme),
  );
}

ThemeData _createBaseTheme(Brightness brightness) => ThemeData(
      brightness: brightness,
      colorSchemeSeed: Colors.cyan,
    );
