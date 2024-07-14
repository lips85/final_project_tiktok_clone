import 'package:final_project_tiktok_clone/features/authentication/view_models/signin_view_model.dart';
import 'package:final_project_tiktok_clone/features/authentication/views/create_account_page.dart';
import 'package:final_project_tiktok_clone/navbar/main_nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
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

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

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
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(200),
              Text(
                "Mood Tracker",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.w800,
                      fontSize: 60,
                    ),
              ).animate(onPlay: (controller) => controller.repeat()).shimmer(
                duration: 3.seconds,
                colors: [
                  const Color(0xFFFF9500),
                  Colors.white,
                  Colors.white,
                  const Color(0xFFFF9500),
                ],
              ),
              const Gap(100),
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
                children: [
                  SvgPicture.asset(
                    "assets/images/nomad.svg",
                    width: 30,
                  ),
                  const Gap(5),
                  Text(
                    "Nomad Coder",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w800),
                  )
                      .animate(onPlay: (controller) => controller.repeat())
                      .shimmer(
                    duration: 2.seconds,
                    colors: [
                      const Color(0xFFFF9500),
                      Colors.white,
                      Colors.white,
                      const Color(0xFFFF9500),
                    ],
                  ),
                ],
              ),
              const Gap(50),
            ],
          ),
        ),
      ),
    );
  }
}
