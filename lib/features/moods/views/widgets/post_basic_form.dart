import 'package:animated_emoji/animated_emoji.dart';
import 'package:final_project_tiktok_clone/features/moods/models/animate_mood.dart';
import 'package:final_project_tiktok_clone/features/moods/models/mood_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostBasicForm extends ConsumerStatefulWidget {
  final MoodModel mood;

  const PostBasicForm({
    super.key,
    required this.mood,
  });

  @override
  PostBasicFormState createState() => PostBasicFormState();
}

class PostBasicFormState extends ConsumerState<PostBasicForm> {
  // void _onThreadTap() async {
  //   await showModalBottomSheet(
  //     context: context,
  //     builder: (context) => const ThreadComments(),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ListTile(
        leading: AnimatedEmoji(
          animatedMood[widget.mood.mood]!,
          size: 50,
        ),
        title: Text(
          widget.mood.mood,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(
          widget.mood.postText,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        trailing: Text(
          widget.mood.postTime,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.grey.shade500,
              ),
        ),
      ),
      // if (widget.isImageUse)
      //   Padding(
      //     padding: const EdgeInsets.symmetric(
      //       vertical: 10,
      //     ),
      //     child: SizedBox(
      //       height:
      //           MediaQuery.of(context).size.width * 0.5,
      //       child: ListView(
      //         scrollDirection: Axis.horizontal,
      //         children: [
      //           if (widget.isImageUse)
      //             for (var i = 0;
      //                 i < widget.postImages.length;
      //                 i++)
      //               TweetImageViewer(
      //                 assetPath: widget.postImages[i],
      //               ),
      //         ],
      //       ),
      //     ),
      //   ),
    );
  }
}
