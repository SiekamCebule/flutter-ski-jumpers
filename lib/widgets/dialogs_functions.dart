// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ski_jumpers/models/apperance.dart';
import 'package:ski_jumpers/models/ski_jumper.dart';
import 'package:ski_jumpers/providers/apperances_provider.dart';
import 'package:ski_jumpers/screens/non-scaffolded/apperances_dialog.dart';

void showJumperProfileDialog(
    SkiJumper jumper, BuildContext context, WidgetRef ref) async {
  // Pokazanie dialogu z CircularProgressIndicator
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const Dialog(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 20),
              Text("Ładowanie..."),
            ],
          ),
        ),
      );
    },
  );

  // Ładowanie danych
  ref.read(apperancesProvider.notifier).state =
      await loadJumperApperances(jumper, -1, []);

  if (!context.mounted) {
    return;
  }

  Future.delayed(const Duration(milliseconds: 400));

  // Wyświetlenie głównego dialogu
  double width = MediaQuery.of(context).size.width;
  print('width: $width');
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Dialog Barrier',
    transitionDuration: const Duration(milliseconds: 1500),
    pageBuilder: (context, animation, secondaryAnimation) {
      return ScaleTransition(
        scale: CurvedAnimation(
          parent: animation,
          curve: Curves.elasticInOut,
        ),
        child: const ApperancesDialog(),
      );
    },
  ).then((_) {
    Navigator.of(context, rootNavigator: true).pop();
  });
}
