import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ski_jumpers/providers/filters_providers.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filtry',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            value: ref.watch(indWcPodiumFilter),
            onChanged: (ok) {
              ref.read(indWcPodiumFilter.notifier).state = ok;
            },
            title: Text(
              'Według podium PŚ',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            subtitle: Text(
              'Filtrowanie według tego, czy zawodnik miał w swojej karierze indywidualne podium Pucharu Świata.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          SwitchListTile(
            value: ref.watch(indMedalFilter),
            onChanged: (ok) {
              ref.read(indMedalFilter.notifier).state = ok;
            },
            title: Text(
              'Według medalu',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            subtitle: Text(
              'Filtrowanie według tego, czy zawodnik zdobył w swojej karierze indywidualny medal Mistrzostw Śświata lub Igrzysk Olimpijskich.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}
