import 'package:animated_emoji/animated_emoji.dart';
import 'package:final_project_tiktok_clone/features/moods/models/animate_mood.dart';
import 'package:final_project_tiktok_clone/features/moods/view_model/mood_view_model.dart';
import 'package:final_project_tiktok_clone/features/moods/views/post_basic_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostScreen extends ConsumerWidget {
  static String routeName = "moods";
  static String routeURL = "/moods";
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moodPosts = ref.watch(moodPostViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mood Posts'),
      ),
      body: ListView.builder(
        itemCount: moodPosts.length,
        itemBuilder: (context, index) {
          final moodPost = moodPosts[index];
          return ListTile(
            leading: AnimatedEmoji(
              animatedMood(moodPost.mood),
              size: 32.0,
            ),
            title: Text(moodPost.mood),
            subtitle: Text(moodPost.postText),
            trailing: Text(moodPost.postTime),
            onLongPress: () {
              _showDeleteConfirmationDialog(context, ref, moodPost.id);
            },
          );
        },
      ),
    );
  }

  void _showDeleteConfirmationDialog(
      BuildContext context, WidgetRef ref, String postId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Post'),
          content: const Text('Are you sure you want to delete this post?'),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                ref
                    .read(moodPostViewModelProvider.notifier)
                    .deleteMoodPost(postId);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
