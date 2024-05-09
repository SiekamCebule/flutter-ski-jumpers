import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

enum ColorSchemeType {
  main,
  alternative,
}

final lightTextThemeProvider = Provider((ref) => GoogleFonts.interTextTheme());
final darkTextThemeProvider = Provider(
  (ref) => GoogleFonts.interTextTheme().apply(
    displayColor: Colors.white70,
    bodyColor: Colors.white,
  ),
);

final mainLightSchemeProvider = Provider((ref) => ColorScheme.fromSeed(
    seedColor: Colors.red[600]!, brightness: Brightness.light));
final altLightSchemeProvider = Provider((ref) => ColorScheme.fromSeed(
    seedColor: Colors.teal[600]!, brightness: Brightness.light));
final mainDarkSchemeProvider = Provider((ref) => ColorScheme.fromSeed(
    seedColor: Colors.blue[300]!, brightness: Brightness.dark));
final altDarkSchemeProvider = Provider((ref) => ColorScheme.fromSeed(
    seedColor: Colors.pink[300]!, brightness: Brightness.dark));
