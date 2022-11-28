import 'package:e_commerce/controllers/app.dart';
import 'package:e_commerce/pages/home.dart';
import 'package:e_commerce/pages/landing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WrapperScreen extends StatelessWidget {
  final AppController c = Get.put(AppController());
  WrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (c.isLoggedIn.isTrue) return HomeScreen();
      return LandingScreen();
    });
  }
}
