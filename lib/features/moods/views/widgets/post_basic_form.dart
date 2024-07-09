import 'package:final_project_tiktok_clone/features/moods/models/mood_model.dart';
import 'package:final_project_tiktok_clone/features/settings/view_models/darkmode_config_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
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
                      Column(
                        children: [
                          Stack(
                            children: [
                              const CircleAvatar(
                                backgroundColor: null,
                                radius: 20,
                              ),
                              Positioned(
                                right: 0,
                                bottom: 0,
                                child: CircleAvatar(
                                  backgroundColor: ref
                                          .watch(darkModeConfigProvider)
                                          .isDarkMode
                                      ? Colors.black
                                      : Colors.white,
                                  radius: 9,
                                  child: const Icon(
                                    FontAwesomeIcons.circlePlus,
                                    size: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Gap(5),
                          Expanded(
                            child: SizedBox(
                              width: 1,
                              child: ColoredBox(
                                color:
                                    ref.watch(darkModeConfigProvider).isDarkMode
                                        ? Colors.grey.shade700
                                        : Colors.grey.shade300,
                              ),
                            ),
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
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        widget.mood.mood,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                      const Gap(10),
                                      SvgPicture.asset(
                                        alignment: Alignment.bottomCenter,
                                        "assets/images/Twitter_Verified_Badge.svg",
                                        width: 20,
                                      ),
                                    ],
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
                                      const Gap(10),
                                      GestureDetector(
                                        // onTap: _onThreadTap,
                                        child: SvgPicture.asset(
                                          "assets/images/three-dots-svgrepo-com.svg",
                                          width: 20,
                                          colorFilter: ColorFilter.mode(
                                            ref
                                                    .watch(
                                                        darkModeConfigProvider)
                                                    .isDarkMode
                                                ? Colors.white
                                                : Colors.black,
                                            BlendMode.srcIn,
                                          ),
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
                              const Gap(5),
                              const Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.heart,
                                    size: 20,
                                  ),
                                  Gap(10),
                                  Icon(
                                    FontAwesomeIcons.comment,
                                    size: 20,
                                  ),
                                  Gap(10),
                                  Icon(
                                    FontAwesomeIcons.repeat,
                                    size: 20,
                                  ),
                                  Gap(10),
                                  Icon(
                                    FontAwesomeIcons.paperPlane,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(8),
              ],
            ),
          ),
          const Gap(10),
          const Divider(),
        ],
      ),
    );
  }
}
