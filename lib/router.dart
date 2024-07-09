import 'package:final_project_tiktok_clone/features/authentication_tread/repos/authentication_repository.dart';
import 'package:final_project_tiktok_clone/features/authentication_tread/views/create_account_page.dart';
import 'package:final_project_tiktok_clone/features/authentication_tread/views/login_page.dart';
import 'package:final_project_tiktok_clone/features/moods/views/post_screen.dart';
import 'package:final_project_tiktok_clone/features/settings/views/settings_screen_tweet.dart';
import 'package:final_project_tiktok_clone/navbar/main_nav_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider((ref) {
  return GoRouter(
    initialLocation: "/",
    redirect: (context, state) {
      final isLoggedIn = ref.read(authRepo).isLoggedIn;
      if (!isLoggedIn) {
        if (state.subloc != CreateAccountPage.routeURL &&
            state.subloc != LogInPage.routeURL) {
          return "/login";
        }
      }
      return null;
    },
    routes: [
      GoRoute(
        name: LogInPage.routeName,
        path: LogInPage.routeURL,
        builder: (context, state) => const LogInPage(),
      ),
      GoRoute(
        name: CreateAccountPage.routeName,
        path: CreateAccountPage.routeURL,
        builder: (context, state) => const CreateAccountPage(),
      ),
      GoRoute(
        name: MainNavScreen.routeName,
        path: MainNavScreen.routeURL,
        builder: (context, state) => const MainNavScreen(),
      ),
      GoRoute(
        name: PostScreen.routeName,
        path: PostScreen.routeURL,
        builder: (context, state) => const PostScreen(),
      ),
      GoRoute(
        name: SettingsScreen.routeName,
        path: SettingsScreen.routeURL,
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
  );
});
