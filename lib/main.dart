import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/firebase/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:final_project_tiktok_clone/features/settings/repos/darkmode_config_repo.dart';
import 'package:final_project_tiktok_clone/features/settings/view_models/darkmode_config_vm.dart';
import 'package:final_project_tiktok_clone/core/router/router.dart';
import 'package:final_project_tiktok_clone/core/const/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final preferences = await SharedPreferences.getInstance();
  final repository = DarkmodeConfigRepository(preferences);

  runApp(
    ProviderScope(
      overrides: [
        darkModeConfigProvider.overrideWith(
          () => DarkmodeConfigViewModel(
            repository,
          ),
        ),
      ],
      child: const HaryFinalProject(),
    ),
  );
}

class HaryFinalProject extends ConsumerStatefulWidget {
  const HaryFinalProject({super.key});

  @override
  ConsumerState<HaryFinalProject> createState() => _HaryFinalProjectState();
}

class _HaryFinalProjectState extends ConsumerState<HaryFinalProject> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: ref.watch(routerProvider),
      debugShowCheckedModeBanner: false,
      title: 'Mood Diary',
      themeMode: ref.watch(darkModeConfigProvider).isDarkMode
          ? ThemeMode.dark
          : ThemeMode.light,
      theme: lightTheme(),
      darkTheme: darkTheme(),
    );
  }
}
