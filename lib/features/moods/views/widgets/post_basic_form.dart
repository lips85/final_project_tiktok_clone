import 'package:animated_emoji/animated_emoji.dart';
import 'package:final_project_tiktok_clone/features/moods/models/mood_model.dart';
import 'package:final_project_tiktok_clone/features/settings/view_models/darkmode_config_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

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
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Column(
                        children: [
                          AnimatedEmoji(
                            AnimatedEmojis.fireHeart,
                            size: 50,
                          ),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.mood.mood,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      Text(
                                        widget.mood.postTime,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                              color: Colors.grey.shade500,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Gap(3),
                              Text(
                                widget.mood.postText,
                                style: Theme.of(context).textTheme.bodyLarge,
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
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
