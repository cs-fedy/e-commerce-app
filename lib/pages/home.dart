import 'package:e_commerce/controllers/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final AppController app = Get.find<AppController>();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () => app.logout(),
            child: const Text("logout"),
          ),
        ),
      ),
    );
  }
}
