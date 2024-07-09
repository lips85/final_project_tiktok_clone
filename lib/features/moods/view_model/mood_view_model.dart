import 'dart:async';

import 'package:final_project_tiktok_clone/features/moods/models/mood_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoodViewModel extends AsyncNotifier<List<MoodModel>> {
  final List<MoodModel> _moodList = [];

  @override
  FutureOr<List<MoodModel>> build() async {
    await Future.delayed(const Duration(seconds: 1));
    return _moodList;
  }
}

final moodProvider = AsyncNotifierProvider<MoodViewModel, List<MoodModel>>(
  () => MoodViewModel(),
);
