import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:ski_jumpers/providers/theme/current_color_scheme_type_provider.dart';
import 'package:ski_jumpers/providers/theme/theme_properties_providers.dart';

class DarkThemeNotifier extends StateNotifier<ThemeData> {
  DarkThemeNotifier(TextTheme textTheme, this.selectedScheme)
      : super(ThemeData(
          useMaterial3: true,
          textTheme: textTheme,
          colorScheme: selectedScheme,
        ));

  final ColorScheme selectedScheme;
}

final darkThemeNotifierProvider =
    StateNotifierProvider<DarkThemeNotifier, ThemeData>(
  (ref) {
    final textTheme = ref.watch(darkTextThemeProvider);
    return DarkThemeNotifier(
      textTheme,
      ref.watch(currentColorSchemeTypeProvider) == ColorSchemeType.main
          ? ref.watch(mainDarkSchemeProvider)
          : ref.watch(altDarkSchemeProvider),
    );
  },
);
