import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ski_jumpers/providers/theme/current_color_scheme_type_provider.dart';
import 'package:ski_jumpers/providers/theme/theme_properties_providers.dart';
import 'package:ski_jumpers/screens/scaffolded/filters_screen.dart';

class MainDrawer extends ConsumerWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NavigationDrawer(
      children: [
        SizedBox(
          height: 100,
          child: DrawerHeader(
            child: Text(
              'Opcje i nawigacja',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
        ),
        SwitchListTile(
          value: ref.watch(currentColorSchemeTypeProvider) ==
              ColorSchemeType.alternative,
          onChanged: (ok) {
            ref.read(currentColorSchemeTypeProvider.notifier).toggle();
          },
          title: Text('Alternatywny schemat kolorów',
              style: Theme.of(context).textTheme.headlineSmall),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 6.5),
            child: Text(
                'Zmienia zestaw kolorów używanych w aplikacji (nie mylić ze zmianą na motyw ciemny/jasny).',
                style: Theme.of(context).textTheme.bodyMedium),
          ),
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 9)),
        ListTile(
          title: const Row(
            children: [
              Icon(Icons.filter_alt),
              Text('Filtry'),
            ],
          ),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const FiltersScreen();
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
