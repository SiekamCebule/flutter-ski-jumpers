// ignore_for_file: avoid_print

import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ski_jumpers/models/ski_jumper.dart';
import 'package:ski_jumpers/providers/current_jumper.dart';
import 'package:ski_jumpers/providers/favorite_jumpers.provider.dart';
import 'package:ski_jumpers/widgets/dialogs_functions.dart';

class JumperCard extends ConsumerWidget {
  const JumperCard({super.key, required this.jumper});
  final SkiJumper jumper;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Flag flag = jumper.country.flag;
    double flagRatio = 1;
    if (flag.width != null && flag.height != null) {
      flagRatio = flag.width! / flag.height!;
    }

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 8,
      child: Ink(
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          splashColor: Colors.deepOrange[100],
          onTap: () {
            ref.read(currentJumperProvider.notifier).state = jumper;
            showJumperProfileDialog(jumper, context, ref);
          },
          child: Column(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Transform.scale(
                        alignment: Alignment.bottomLeft,
                        scale: 0.925,
                        child: AspectRatio(
                          aspectRatio: 1 / 1.6,
                          child: Image(
                            image: jumper.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.cake),
                              Text(
                                jumper.formattedBirthdate,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                          Row(
                            children: [
                              Icon(
                                jumper.hasIndWCPodium
                                    ? Icons.thumb_up
                                    : Icons.thumb_down,
                                color: jumper.hasIndWCPodium
                                    ? Colors.blue
                                    : Colors.red,
                                size: 18,
                              ),
                              const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 2)),
                              Expanded(
                                child: Text(
                                  jumper.hasIndWCPodium
                                      ? 'Stał na podium Pucharu Świata'
                                      : 'Brak podium Pucharu Świata',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                          Row(
                            children: [
                              Icon(
                                jumper.hasIndMedal
                                    ? Icons.thumb_up
                                    : Icons.thumb_down,
                                color: jumper.hasIndMedal
                                    ? Colors.blue
                                    : Colors.red,
                                size: 18,
                              ),
                              const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 2)),
                              Expanded(
                                child: Text(
                                  jumper.hasIndMedal
                                      ? 'Ma medal rangi mistrzowskiej'
                                      : 'Brak medalu rangi mistrzowskiej',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ),
                            ],
                          ),
                          const Padding(padding: EdgeInsets.only(top: 8)),
                        ],
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(right: 5)),
                  ],
                ),
              ),
              GestureDetector(
                onDoubleTap: () {
                  print("ONDTAP");
                  ref
                      .watch(favoriteJumpersProvider.notifier)
                      .toggleFavorite(jumper);
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: const Duration(milliseconds: 2200),
                      content: Text(
                        ref.watch(favoriteJumpersProvider).contains(jumper)
                            ? 'Dodano skoczka do ulubionych'
                            : 'Usunięto skoczka z ulubionych',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.background),
                      ),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.8),
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(15)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30,
                        width: 30 * flagRatio,
                        child: jumper.country.flag,
                      ),
                      Expanded(
                        child: Text(
                          jumper.nameAndSurname,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: !ref
                                          .watch(favoriteJumpersProvider)
                                          .contains(jumper)
                                      ? Theme.of(context)
                                          .colorScheme
                                          .background
                                          .withOpacity(0.8)
                                      : Theme.of(context).brightness ==
                                              Brightness.light
                                          ? Colors.amberAccent[100]
                                          : Colors.yellow[900]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
