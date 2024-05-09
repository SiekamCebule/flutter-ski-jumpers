import 'package:flutter/material.dart';

class JumperProfile extends StatelessWidget {
  const JumperProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profil skoczka',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: const Column(
        children: [
          Text(''),
        ],
      ),
    );
  }
}
