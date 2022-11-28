import 'package:e_commerce/components/toggle_section_button.dart';
import 'package:e_commerce/controllers/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login.dart';
import 'signup.dart';

class AuthScreen extends StatelessWidget {
  final AuthController c = Get.find<AuthController>();
  AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 23,
            vertical: 30,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Row(
                    children: [
                      Obx(
                        () => ToggleSectionButton(
                          content: "Login",
                          clickHandler: () => c.toggleLogin(),
                          isSelected: c.isLoginSection.isTrue,
                        ),
                      ),
                      Obx(
                        () => ToggleSectionButton(
                          content: "Register",
                          clickHandler: () => c.toggleSignup(),
                          isSelected: c.isLoginSection.isFalse,
                        ),
                      )
                    ],
                  ),
                ),
                Obx(
                  (() => c.isLoginSection.isTrue
                      ? const LoginScreen()
                      : const SignupScreen()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
