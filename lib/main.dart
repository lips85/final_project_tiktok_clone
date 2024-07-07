import 'package:final_project_tiktok_clone/features/settings/repos/darkmode_config_repo.dart';
import 'package:final_project_tiktok_clone/features/settings/view_models/darkmode_config_vm.dart';
import 'package:final_project_tiktok_clone/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

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
      title: 'Flutter Demo',
      themeMode: ref.watch(darkModeConfigProvider).isDarkMode
          ? ThemeMode.dark
          : ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.light,
        splashColor: Colors.transparent,
        scaffoldBackgroundColor: Colors.white,
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Colors.white,
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all(Colors.black),
            backgroundColor: WidgetStateProperty.all(Colors.transparent),
          ),
        ),
        primaryColor: const Color(0xff4E98E9),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xff4E98E9),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
          indicatorColor: Colors.black,
          dividerColor: Colors.white,
        ),
      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: const Color(0xff4E98E9),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xff4E98E9),
        ),
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Colors.black,
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all(Colors.white),
            backgroundColor: WidgetStateProperty.all(Colors.transparent),
          ),
        ),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.grey.shade700,
          dividerColor: Colors.black,
        ),
      ),
    );
  }
}
