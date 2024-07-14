import 'package:final_project_tiktok_clone/core/const/animate_mood.dart';
import 'package:final_project_tiktok_clone/features/moods/models/mood_post_model.dart';
import 'package:final_project_tiktok_clone/features/moods/view_model/mood_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
      height: size.height * 0.6,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Gap(50),
              Text(
                "당신의 기분을 표현하세요!",
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
              )
                  .animate(
                onPlay: (controller) => controller.repeat(),
              )
                  .shimmer(
                duration: 2.seconds,
                colors: [
                  const Color(0xFF4682B4),
                  const Color(0xFFB0E0E6),
                  const Color(0xFF4682B4),
                ],
              ),
              const Gap(50),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DropdownButtonFormField<String>(
                      value: mood,
                      items: moods.map<DropdownMenuItem<String>>((String mood) {
                        return DropdownMenuItem<String>(
                          value: mood,
                          child: Text(
                            mood,
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          mood = newValue!;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: '현재 기분!',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 2.0),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        filled: true,
                      ),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: '한마디 하세요!',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 2.0),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        filled: true,
                      ),
                      onSaved: (value) {
                        postText = value!;
                      },
                      maxLines: 2,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _addMoodPost,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15),
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      child: const Text(
                        'Add Mood Post',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
