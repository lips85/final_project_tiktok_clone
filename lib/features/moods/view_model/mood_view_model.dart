import 'package:final_project_tiktok_clone/features/moods/models/mood_post_model.dart';
import 'package:final_project_tiktok_clone/features/moods/repos/mood_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoodPostViewModel extends StateNotifier<List<MoodPost>> {
  final MoodPostRepository repository;

  MoodPostViewModel(this.repository) : super([]) {
    _fetchMoodPosts();
  }

  Future<void> addMoodPost(MoodPost moodPost) async {
    await repository.addMoodPost(moodPost);
    _fetchMoodPosts();
  }

  Future<void> deleteMoodPost(String id) async {
    await repository.deleteMoodPost(id);
    _fetchMoodPosts();
  }

  void _fetchMoodPosts() {
    repository.getMoodPosts().listen((moodPosts) {
      state = moodPosts;
    });
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
