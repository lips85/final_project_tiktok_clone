import 'package:final_project_tiktok_clone/features/moods/view_model/mood_view_model.dart';
import 'package:final_project_tiktok_clone/features/moods/views/widgets/post_basic_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class PostScreen extends ConsumerStatefulWidget {
  static String routeName = "Main";
  static String routeURL = "/main";

  const PostScreen({super.key});

  @override
  PostScreenState createState() => PostScreenState();
}

class PostScreenState extends ConsumerState<PostScreen> {
  void _deleteMood() {
    // ref.read(moodProvider.notifier).deleteMood();
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(moodProvider).when(
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, stack) => Center(
            child: Text(
              'Error: $error',
              style: const TextStyle(color: Colors.red),
            ),
          ),
          data: (moods) => SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Gap(20),
                  Center(
                    child: Text(
                      "Mood",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  const Gap(20),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: moods.length,
                    itemBuilder: (BuildContext context, int index) {
                      final mood = moods[index];
                      final GlobalKey<FormState> formKey =
                          GlobalKey<FormState>();
                      return Form(
                        key: formKey,
                        child: GestureDetector(
                          onLongPress: _deleteMood,
                          child: PostBasicForm(
                            mood: mood,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
  }
}
