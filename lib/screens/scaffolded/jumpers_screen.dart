import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ski_jumpers/models/ski_jumper.dart';
import 'package:ski_jumpers/providers/favorite_jumpers.provider.dart';
import 'package:ski_jumpers/widgets/jumper_card.dart';

class JumpersScreen extends ConsumerWidget {
  const JumpersScreen({super.key, required this.jumpers});

  final List<SkiJumper> jumpers;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double width = MediaQuery.of(context).size.width;
    Widget content;

    if (jumpers.isEmpty) {
      content = Center(
        child: Text(
          'Nie znaleziono żadnych skoczków :(',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      );
    } else {
      content = Padding(
        padding: const EdgeInsets.all(7.5),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: width > 600 ? 4 : 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10),
          itemCount: jumpers.length,
          itemBuilder: ((context, index) => JumperCard(jumper: jumpers[index])),
        ),
      );
    }

    return jumpers == ref.watch(favoriteJumpersProvider)
        ? content
        : Scaffold(
            appBar: AppBar(
              title: Text(
                'Zawodnicy',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            body: content,
          );
  }
}
