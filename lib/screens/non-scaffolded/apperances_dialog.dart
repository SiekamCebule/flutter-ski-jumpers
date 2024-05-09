import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ski_jumpers/models/apperance.dart';
import 'package:ski_jumpers/models/ski_jumper.dart';
import 'package:ski_jumpers/providers/apperances_provider.dart';
import 'package:ski_jumpers/providers/current_jumper.dart';
import 'package:ski_jumpers/widgets/apperance_card.dart';

class ApperancesDialog extends ConsumerWidget {
  const ApperancesDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SkiJumper jumper = ref.watch(currentJumperProvider);
    List<Apperance> apperances = ref.watch(apperancesProvider);
    double width = MediaQuery.of(context).size.width;
    return Dialog(
      elevation: 40,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.95,
        height: MediaQuery.of(context).size.height * 0.8,
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            children: [
              Text(
                '${jumper.name} ${jumper.surname} - występy',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Expanded(
                child: width >= 600
                    ? GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4, childAspectRatio: 1.25 / 1),
                        shrinkWrap: true,
                        itemCount: apperances.length,
                        itemBuilder: (context, index) {
                          return ApperanceCard(apperance: apperances[index]);
                        },
                      )
                    : ListView.builder(
                        itemCount: apperances.length,
                        itemBuilder: (context, index) {
                          return ApperanceCard(apperance: apperances[index]);
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
