import 'package:final_project_tiktok_clone/features/writes/models/mood_post_model.dart';
import 'package:final_project_tiktok_clone/features/writes/repos/mood_post_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoodPostViewModel extends StateNotifier<List<MoodPost>> {
  final MoodPostRepository repository;

  MoodPostViewModel(this.repository) : super([]);

  Future<void> addMoodPost(MoodPost moodPost) async {
    await repository.addMoodPost(moodPost);
    state = [...state, moodPost];
  }
}

final moodPostRepositoryProvider = Provider<MoodPostRepository>((ref) {
  return MoodPostRepository();
});

final moodPostViewModelProvider =
    StateNotifierProvider<MoodPostViewModel, List<MoodPost>>((ref) {
  final repository = ref.watch(moodPostRepositoryProvider);
  return MoodPostViewModel(repository);
});
