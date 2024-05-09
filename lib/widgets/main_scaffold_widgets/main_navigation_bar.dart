import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ski_jumpers/providers/current_screen_id_provider.dart';

class MainNavigationBar extends ConsumerWidget {
  const MainNavigationBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Drużyny'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Ulubione'),
      ],
      currentIndex: ref.watch(currentScreenIdProvider),
      onTap: (idx) {
        ref.read(currentScreenIdProvider.notifier).state = idx;
      },
    );
  }
}
