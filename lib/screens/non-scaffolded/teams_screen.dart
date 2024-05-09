import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ski_jumpers/models/country.dart';
import 'package:ski_jumpers/providers/data_providers.dart';
import 'package:ski_jumpers/widgets/team_card.dart';

class TeamsScreen extends ConsumerWidget {
  const TeamsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Country> countries = ref.watch(countriesProvider);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width > 600
                    ? 6
                    : 3, // Liczba kolumn
                mainAxisSpacing: 10, // Odstępy pomiędzy wierszami
                crossAxisSpacing: 20, // Odstępy pomiędzy kolumnami
              ),
              itemCount: countries.length,
              itemBuilder: (context, index) =>
                  TeamCard(country: countries[index]),
            ),
          ),
        ),
      ],
    );
  }
}
