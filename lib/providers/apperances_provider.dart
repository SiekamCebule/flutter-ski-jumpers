import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ski_jumpers/models/apperance.dart';

var apperancesProvider = StateProvider<List<Apperance>>((ref) => []);
