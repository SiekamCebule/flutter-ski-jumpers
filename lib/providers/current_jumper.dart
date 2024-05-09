import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ski_jumpers/models/ski_jumper.dart';
import 'package:ski_jumpers/providers/data_providers.dart';

var currentJumperProvider =
    StateProvider<SkiJumper>((ref) => ref.watch(jumpersProvider)[0]);
