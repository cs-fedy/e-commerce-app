import 'package:e_commerce/components/button.dart';
import 'package:e_commerce/components/custom_input.dart';
import 'package:e_commerce/components/google_button.dart';
import 'package:e_commerce/controllers/app.dart';
import 'package:e_commerce/controllers/auth.dart';
import 'package:e_commerce/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final AuthController auth = Get.find<AuthController>();
  final AppController app = Get.find<AppController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String email;
  late String password;
  late String fullName;
  String? error;

  Future handleSignup() async {
    _formKey.currentState?.save();
    final payload = await app.signup(email, password, fullName);

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
          "Sign Up",
          style: Theme.of(context).textTheme.b18,
        ),
        const SizedBox(height: 22),
        Text(
          "Register to get started! Already have an account?",
          style: Theme.of(context).textTheme.r16,
        ),
        const SizedBox(height: 8),
        TextButton(
          onPressed: () => auth.toggleLogin(),
          child: Text(
            "Sign In",
            style:
                Theme.of(context).textTheme.r16.copyWith(color: primaryColor),
          ),
        ),
        const SizedBox(height: 44),
        Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                onSaved: (newValue) => email = newValue as String,
                hintText: "email@example.com",
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 19),
              CustomTextField(
                onSaved: (newValue) => fullName = newValue as String,
                hintText: "full name",
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 19),
              CustomTextField(
                onSaved: (newValue) => password = newValue as String,
                hintText: "strong password",
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                isPassword: true,
              ),
              const SizedBox(height: 29),
              Button(
                content: "Sign up",
                clickHandler: () => handleSignup(),
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
          content: "Signup with google",
          clickHandler: () => handleGoogleSignIn(),
        ),
      ],
    );
  }
}
