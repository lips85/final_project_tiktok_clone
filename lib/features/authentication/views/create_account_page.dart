import 'package:final_project_tiktok_clone/features/authentication/utils/common_button.dart';
import 'package:final_project_tiktok_clone/features/authentication/utils/validators.dart';
import 'package:final_project_tiktok_clone/features/authentication/view_models/signup_view_model.dart';
import 'package:final_project_tiktok_clone/navbar/main_nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class CreateAccountPage extends ConsumerStatefulWidget {
  static String routeName = "Create Account";
  static String routeURL = "/createAccount";
  const CreateAccountPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      CreateAccountPageState();
}

class CreateAccountPageState extends ConsumerState<CreateAccountPage> {
  var formValues = <String, String>{};

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();

  String _email = "";
  String _password = "";
  String _passwordConfirm = "";
  bool _isPasswordVisible = false;
  bool _isPasswordConfirmVisible = false;

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
    _passwordConfirmController.addListener(() {
      setState(() {
        _passwordConfirm = _passwordConfirmController.text;
      });
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _togglePasswordConfirmVisibility() {
    setState(() {
      _isPasswordConfirmVisible = !_isPasswordConfirmVisible;
    });
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSignUpPressed() async {
    if (!Validators.isFormValid(_email, _password, _passwordConfirm)) {
      return;
    }

    await ref.read(signUpProvider.notifier).signUpWithEmailAndPassword(
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
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                  hintText: 'Mobile number or email',
                  errorText: Validators.validateEmail(_email),
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
                autocorrect: false,
                cursorColor: Theme.of(context).primaryColor,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  hintText: 'Password',
                  errorText: Validators.validatePassword(_password),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                ),
              ),
              const Gap(20),
              TextField(
                controller: _passwordConfirmController,
                autocorrect: false,
                cursorColor: Theme.of(context).primaryColor,
                obscureText: !_isPasswordConfirmVisible,
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  errorText:
                      Validators.confirmPassword(_password, _passwordConfirm),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordConfirmVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: _togglePasswordConfirmVisibility,
                  ),
                ),
              ),
              const Gap(20),
              CommonButton(
                textChange: Validators.isFormValid(
                  _email,
                  _password,
                  _passwordConfirm,
                ),
                validate: Validators.isFormValid(
                  _email,
                  _password,
                  _passwordConfirm,
                ),
                colorChange: Validators.isFormValid(
                  _email,
                  _password,
                  _passwordConfirm,
                ),
                text: "Create new account",
                onPressed: _onSignUpPressed,
              ),
              const Spacer(),
              TextButton(
                onPressed: () => context.pop(),
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
                  'Back to Sign in page',
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
                    duration: 3.seconds,
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
