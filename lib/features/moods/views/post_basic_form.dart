import 'package:final_project_tiktok_clone/core/const/animate_mood.dart';
import 'package:final_project_tiktok_clone/features/moods/models/mood_post_model.dart';
import 'package:final_project_tiktok_clone/features/moods/view_model/mood_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostBasicForm extends ConsumerStatefulWidget {
  const PostBasicForm({super.key});

  @override
  ConsumerState<PostBasicForm> createState() => _PostBasicFormState();
}

class _PostBasicFormState extends ConsumerState<PostBasicForm> {
  final _formKey = GlobalKey<FormState>();
  String mood = moods.first; // Default to the first mood in the list
  String postText = '';

  void _addMoodPost() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      DateTime now = DateTime.now();
      String postTime = now.toIso8601String(); // Save the actual time

      MoodPost newPost = MoodPost(
        id: '',
        mood: mood,
        postText: postText,
        postTime: postTime,
        postDate: now,
      );
      await ref.read(moodPostViewModelProvider.notifier).addMoodPost(newPost);
      if (mounted) {
        Navigator.of(context).pop(); // Close the modal after saving
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.7,
      padding: const EdgeInsets.all(
          20), // To make sure the form fields are visible above the keyboard
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField<String>(
              value: mood,
              items: moods.map<DropdownMenuItem<String>>((String mood) {
                return DropdownMenuItem<String>(
                  value: mood,
                  child: Text(mood),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  mood = newValue!;
                });
              },
              decoration: const InputDecoration(labelText: 'Mood'),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Post Text'),
              onSaved: (value) {
                postText = value!;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addMoodPost,
              child: const Text('Add Mood Post'),
            ),
          ],
        ),
      ),
    );
  }
}
