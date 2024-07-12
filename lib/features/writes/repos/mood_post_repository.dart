import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/mood_post_model.dart';

class MoodPostRepository {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('moodPosts');

  Future<void> addMoodPost(MoodPost moodPost) {
    return collection.add(moodPost.toMap());
  }
}
