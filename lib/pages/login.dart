import 'package:e_commerce/components/button.dart';
import 'package:e_commerce/components/google_button.dart';
import 'package:e_commerce/components/input.dart';
import 'package:e_commerce/controllers/app.dart';
import 'package:e_commerce/controllers/auth.dart';
import 'package:e_commerce/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthController auth = Get.find<AuthController>();
  final AppController app = Get.find<AppController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String email;
  late String password;
  String? error;

  Future handleLogin() async {
    _formKey.currentState?.save();
    final payload = await app.login(email, password);

    if (payload["error"]) {
      setState(() => error = payload["message"]);
    }
  }

  Future handleGoogleSignIn() async {
    final payload = await app.googleLogin();
    if (payload["error"]) {
      setState(() => error = payload["message"]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Sign In",
          style: Theme.of(context).textTheme.b18,
        ),
        const SizedBox(height: 22),
        Text(
          "Welcome back! Don't have an account?",
          style: Theme.of(context).textTheme.r16,
        ),
        const SizedBox(height: 8),
        TextButton(
          onPressed: () => auth.toggleSignup(),
          child: Text(
            "Sign Up",
            style:
                Theme.of(context).textTheme.r16.copyWith(color: primaryColor),
          ),
        ),
        const SizedBox(height: 44),
        Form(
          key: _formKey,
          child: Column(
            children: [
              Input(
                onSaved: (newValue) => email = newValue as String,
                hintText: "email@example.com",
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 19),
              Input(
                onSaved: (newValue) => password = newValue as String,
                hintText: "user password",
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                isPassword: true,
              ),
              const SizedBox(height: 29),
              Button(
                content: "Login",
                clickHandler: () => handleLogin(),
                isPrimary: true,
              ),
              const SizedBox(height: 10),
              Text(
                error ?? "",
                style: Theme.of(context)
                    .textTheme
                    .r12
                    .copyWith(color: Colors.red[500]),
              ),
            ],
          ),
        ),
        const SizedBox(height: 23),
        Row(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                height: 2,
                width: double.infinity,
                decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  "OR",
                  style: Theme.of(context)
                      .textTheme
                      .r14
                      .copyWith(color: primaryColor),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                height: 2,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFFD9D9D9),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 39),
        GoogleButton(
          content: "Login with google",
          clickHandler: () => handleGoogleSignIn(),
        ),
      ],
    );
  }
}
