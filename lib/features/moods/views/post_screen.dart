import 'package:animated_emoji/animated_emoji.dart';
import 'package:final_project_tiktok_clone/core/const/animate_mood.dart';
import 'package:final_project_tiktok_clone/features/moods/view_model/mood_view_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timeago/timeago.dart' as timeago;

class PostScreen extends ConsumerWidget {
  static String routeName = "moods";
  static String routeURL = "/moods";
  const PostScreen({super.key});

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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moodPosts = ref.watch(moodPostViewModelProvider);
    timeago.setLocaleMessages('ko', timeago.KoMessages());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mood Posts'),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: moodPosts.length,
        itemBuilder: (context, index) {
          final moodPost = moodPosts[index];
          final DateTime postDate = DateTime.parse(moodPost.postTime);

          return Animate(
            effects: [
              FadeEffect(duration: 900.ms, delay: (index * 100).ms),
              const MoveEffect(
                  begin: Offset(-16, 0), curve: Curves.easeOutQuad),
              const ShimmerEffect(
                  color: Colors.white12, blendMode: BlendMode.srcOver)
            ],
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.amber.shade50, Colors.grey.shade50],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                border: Border.all(
                  color: Colors.transparent,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(2, 4),
                  ),
                ],
              ),
              margin: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
              child: ListTile(
                leading: AnimatedEmoji(
                  animatedMood(moodPost.mood),
                  size: 32.0,
                ),
                style: ListTileStyle.drawer,
                title: Text(moodPost.mood),
                titleTextStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.black,
                    ),
                subtitle: Text(moodPost.postText),
                subtitleTextStyle:
                    Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.black,
                        ),
                trailing: Text(timeago.format(postDate, locale: "ko")),
                leadingAndTrailingTextStyle:
                    Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.grey.shade600,
                        ),
                onLongPress: () {
                  _showDeleteConfirmationDialog(context, ref, moodPost.id);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
