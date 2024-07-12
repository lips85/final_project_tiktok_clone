import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_tiktok_clone/features/moods/models/mood_post_model.dart';

class MoodPostRepository {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('moodPosts');

  Future<void> addMoodPost(MoodPost moodPost) {
    return collection.add(moodPost.toMap());
  }

  Future<void> deleteMoodPost(String id) {
    return collection.doc(id).delete();
  }

  Stream<List<MoodPost>> getMoodPosts() {
    return collection.snapshots().map((query) =>
        query.docs.map((doc) => MoodPost.fromFirestore(doc)).toList());
  }
}
