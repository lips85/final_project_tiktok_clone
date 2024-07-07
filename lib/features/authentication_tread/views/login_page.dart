import 'package:final_project_tiktok_clone/features/authentication_tread/view_models/signin_view_model.dart';
import 'package:final_project_tiktok_clone/features/authentication_tread/views/create_account_page.dart';
import 'package:final_project_tiktok_clone/features/settings/view_models/darkmode_config_vm.dart';
import 'package:final_project_tiktok_clone/navbar/main_nav_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class LogInPage extends ConsumerStatefulWidget {
  static String routeName = "LogIn";
  static String routeURL = "/login";
  const LogInPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => LogInPageState();
}

class LogInPageState extends ConsumerState<LogInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _email = "";
  String _password = "";

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      setState(() {
        _email = _emailController.text;
      });
    });
    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // void _onScaffoldTap() {
  //   FocusScope.of(context).unfocus();
  // }

  void _onSignInPressed() async {
    if (_email.isEmpty || _password.isEmpty) {
      return;
    }

    await ref.read(signInProvider.notifier).signInWithEmailAndPassword(
          email: _email,
          password: _password,
        );

    if (mounted) {
      context.go(MainNavScreen.routeURL);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(50),
            Text(
              "English (US)",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Colors.grey.shade700,
                  ),
            ),
            const Gap(100),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ref.watch(darkModeConfigProvider).isDarkMode
                    ? Colors.white
                    : Colors.black,
              ),
              child: FaIcon(
                FontAwesomeIcons.threads,
                size: size.width * 0.14,
                color: ref.watch(darkModeConfigProvider).isDarkMode
                    ? Colors.black
                    : Colors.white,
              ),
            ),
            const Gap(120),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Mobile number or email',
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
            const Gap(20),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
              ),
            ),
            const Gap(20),
            TextButton(
              onPressed: _onSignInPressed,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Theme.of(context).primaryColor,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Text(
                'Log in',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Forgot password?',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () => context.push(CreateAccountPage.routeURL),
              style: TextButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                side: BorderSide(
                  color: Colors.grey.shade300,
                  width: 1.5,
                ),
              ),
              child: Text(
                'Create new account',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FaIcon(
                  FontAwesomeIcons.meta,
                  size: 18,
                  color: Colors.grey.shade700,
                ),
                const Gap(5),
                Text(
                  "Meta",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.grey.shade700,
                      ),
                ),
              ],
            ),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}
