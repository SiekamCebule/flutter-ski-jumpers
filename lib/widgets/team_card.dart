import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ski_jumpers/models/country.dart';
import 'package:ski_jumpers/models/ski_jumper.dart';
import 'package:ski_jumpers/providers/data_providers.dart';
import 'package:ski_jumpers/providers/filters_providers.dart';
import 'package:ski_jumpers/screens/scaffolded/jumpers_screen.dart';

class TeamCard extends ConsumerWidget {
  const TeamCard({super.key, required this.country});

  final Country country;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<SkiJumper> jumpers = ref.watch(jumpersProvider).where(
      (j) {
        if (ref.watch(indWcPodiumFilter) && !j.hasIndWCPodium) {
          return false;
        }
        if (ref.watch(indMedalFilter) && !j.hasIndMedal) {
          return false;
        }
        return true;
      },
    ).toList();

    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
              width: 2,
              style: BorderStyle.solid,
              color:
                  Theme.of(context).colorScheme.onBackground.withOpacity(0.5))),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15), // Zaokrąglenie rogu
        child: Ink(
          child: InkWell(
            onTap: () {
              /*Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return JumpersScreen(
                  jumpers: jumpers
                      .where((element) => element.country == country)
                      .toList(),
                ); // Implementacja nawigacji
              }));*/
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      JumpersScreen(
                    jumpers: jumpers
                        .where((element) => element.country == country)
                        .toList(),
                  ), // Implem, // Tutaj wstaw nazwę Twojej nowej strony
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    var begin = const Offset(
                        1.0, 0.0); // Początkowe przesunięcie z prawej
                    var end =
                        Offset.zero; // Końcowe przesunięcie (brak przesunięcia)
                    var curve = Curves.easeInOut; // Krzywa animacji

                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));
                    var offsetAnimation = animation.drive(tween);
                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
                  transitionDuration: const Duration(milliseconds: 500),
                ),
              );
            },
            splashColor: Colors.deepOrange[900],
            borderRadius: BorderRadius.circular(15),
            child: AspectRatio(
              aspectRatio: 3 / 2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Opacity(
                      opacity: 0.75,
                      child: country.flag,
                    ),
                  ),
                  Container(
                    height: 28,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(0.75),
                    ),
                    child: Center(
                      child: Text(
                        country.name,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .background
                                .withOpacity(0.75)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
