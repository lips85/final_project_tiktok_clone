import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/mood_post_model.dart';
import '../view_model/mood_post_view_model.dart';

class WriteScreen extends ConsumerStatefulWidget {
  const WriteScreen({super.key});

  @override
  ConsumerState<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends ConsumerState<WriteScreen> {
  final _formKey = GlobalKey<FormState>();
  String mood = '';
  String postText = '';
  String postTime = '';

  void _addMoodPost() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      MoodPost newPost = MoodPost(
        id: '',
        mood: mood,
        postText: postText,
        postTime: postTime,
        postDate: DateTime.now(),
      );
      await ref.read(moodPostViewModelProvider.notifier).addMoodPost(newPost);
      if (mounted) {
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Mood Post')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Mood'),
                onSaved: (value) {
                  mood = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Post Text'),
                onSaved: (value) {
                  postText = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Post Time'),
                onSaved: (value) {
                  postTime = value!;
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
      ),
    );
  }
}
