import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_tiktok_clone/features/moods/models/mood_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoodRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  // create Mood
  Future<void> createMood(MoodModel mood) async {}
  // get Mood
  // update Mood
}

final moodRepo = Provider((ref) => MoodRepository);
