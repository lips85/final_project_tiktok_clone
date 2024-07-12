import 'package:cloud_firestore/cloud_firestore.dart';

class MoodPost {
  String id;
  String mood;
  String postText;
  String postTime;
  DateTime postDate;

  MoodPost({
    required this.id,
    required this.mood,
    required this.postText,
    required this.postTime,
    required this.postDate,
  });

  factory MoodPost.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return MoodPost(
      id: doc.id,
      mood: data['mood'] ?? '',
      postText: data['postText'] ?? '',
      postTime: data['postTime'] ?? '',
      postDate: (data['postDate'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'mood': mood,
      'postText': postText,
      'postTime': postTime,
      'postDate': postDate,
    };
  }
}
