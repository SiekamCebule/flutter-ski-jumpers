import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ski_jumpers/models/ski_jumper.dart';

class FavoriteJumperNotifer extends StateNotifier<List<SkiJumper>> {
  FavoriteJumperNotifer() : super([]);

  void toggleFavorite(SkiJumper jumper) {
    if (state.contains(jumper)) {
      state = state.where((element) => element != jumper).toList();
    } else {
      state = [...state, jumper];
    }
  }
}

var favoriteJumpersProvider =
    StateNotifierProvider<FavoriteJumperNotifer, List<SkiJumper>>(
        (ref) => FavoriteJumperNotifer());
