import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:ski_jumpers/providers/theme/current_color_scheme_type_provider.dart';
import 'package:ski_jumpers/providers/theme/theme_properties_providers.dart';

class LightThemeNotifier extends StateNotifier<ThemeData> {
  LightThemeNotifier(TextTheme textTheme, this.selectedScheme)
      : super(ThemeData(
          useMaterial3: true,
          textTheme: textTheme,
          colorScheme: selectedScheme,
        ));

  final ColorScheme selectedScheme;
}

final lightThemeNotifierProvider =
    StateNotifierProvider<LightThemeNotifier, ThemeData>(
  (ref) {
    final textTheme = ref.watch(lightTextThemeProvider);
    return LightThemeNotifier(
      textTheme,
      ref.watch(currentColorSchemeTypeProvider) == ColorSchemeType.main
          ? ref.watch(mainLightSchemeProvider)
          : ref.watch(altLightSchemeProvider),
    );
  },
);
