import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainAppBar extends ConsumerWidget {
  const MainAppBar(this.titleText, {super.key});

  final String titleText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Builder(
        builder: (context) {
          return Text(
            titleText,
            style: Theme.of(context).textTheme.headlineMedium,
          );
        },
      ),
    );
  }
}

class MainAppBarWrapper extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBarWrapper(this.titleText, {super.key});

  final String titleText;

  @override
  Widget build(BuildContext context) {
    return MainAppBar(titleText);
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight); // Domyślna wysokość AppBar
}
