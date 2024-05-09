import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ski_jumpers/providers/theme/theme_properties_providers.dart';

class CurrentColorSchemeTypeNotifer extends StateNotifier<ColorSchemeType> {
  CurrentColorSchemeTypeNotifer() : super(ColorSchemeType.main);

  void toggle() {
    state = state == ColorSchemeType.main
        ? ColorSchemeType.alternative
        : ColorSchemeType.main;
  }
}

var currentColorSchemeTypeProvider =
    StateNotifierProvider<CurrentColorSchemeTypeNotifer, ColorSchemeType>(
        (ref) => CurrentColorSchemeTypeNotifer());
