import 'dart:async';

import 'package:final_project_tiktok_clone/features/moods/models/mood_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoodViewModel extends AsyncNotifier<List<MoodModel>> {
  final List<MoodModel> _moodList;

  MoodViewModel()
      : _moodList = [
          MoodModel(
            mood: 'Happy',
            postText: 'I am happy today',
            postTime: '12:00 PM',
            postDate: DateTime.now(),
          ),
          MoodModel(
            mood: 'Sad',
            postText: 'I am sad today',
            postTime: '12:00 PM',
            postDate: DateTime.now(),
          )
        ];

  // void deleteMood() {
  //   _moodList.removeAt(0);
  // }

  @override
  FutureOr<List<MoodModel>> build() async {
    await Future.delayed(const Duration(seconds: 1));
    return _moodList;
  }
}

final moodProvider = AsyncNotifierProvider<MoodViewModel, List<MoodModel>>(
  () => MoodViewModel(),
);
