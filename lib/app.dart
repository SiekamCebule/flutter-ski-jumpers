// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ski_jumpers/providers/favorite_jumpers.provider.dart';
import 'package:ski_jumpers/providers/theme/current_color_scheme_type_provider.dart';
import 'package:ski_jumpers/providers/theme/dark_theme_provider.dart';
import 'package:ski_jumpers/providers/theme/light_theme_provider.dart';
import 'package:ski_jumpers/providers/current_screen_id_provider.dart';
import 'package:ski_jumpers/screens/non-scaffolded/teams_screen.dart';
import 'package:ski_jumpers/screens/scaffolded/jumpers_screen.dart';
import 'package:ski_jumpers/widgets/main_scaffold_widgets/main_app_bar.dart';
import 'package:ski_jumpers/widgets/main_scaffold_widgets/main_drawer.dart';
import 'package:ski_jumpers/widgets/main_scaffold_widgets/main_navigation_bar.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, ref) {
    String screenText = '';
    Widget widget;
    switch (ref.watch(currentScreenIdProvider)) {
      case 0: //'teams-screen'
        screenText = "Drużyny";
        widget = const TeamsScreen();
        break;
      default:
        screenText = 'Ulubione';
        widget = JumpersScreen(jumpers: ref.watch(favoriteJumpersProvider));
        break;
    }

    print(
        'current color scheme: ${ref.read(currentColorSchemeTypeProvider).name}');

    return MaterialApp(
      home: Scaffold(
        appBar: MainAppBarWrapper(screenText),
        body: widget,
        bottomNavigationBar: const MainNavigationBar(),
        drawer: const MainDrawer(),
      ),
      theme: ref.watch(lightThemeNotifierProvider),
      darkTheme: ref.watch(darkThemeNotifierProvider),
    );
  }
}
