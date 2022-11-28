import 'package:e_commerce/components/button.dart';
import 'package:e_commerce/controllers/auth.dart';
import 'package:e_commerce/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LandingScreen extends StatelessWidget {
  final AuthController c = Get.put(AuthController());
  LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 23,
            vertical: 30,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 314,
                height: 262,
                child: SvgPicture.asset("assets/svg/successful_purchase.svg"),
              ),
              Text(
                "All your shopping in one App",
                style: Theme.of(context).textTheme.r35,
              ),
              Text(
                "Sell your devices the smarter, faster way for immediate cash and a cleaner conscience. Sell your devices the smarter, faster way for immediate cash and a cleaner conscience.",
                style: Theme.of(context).textTheme.r16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Button(
                      clickHandler: () {
                        c.toggleLogin();
                        Get.toNamed("/Auth");
                      },
                      isPrimary: true,
                      content: "Log in",
                    ),
                  ),
                  Expanded(
                    child: Button(
                      clickHandler: () {
                        c.toggleSignup();
                        Get.toNamed("/Auth");
                      },
                      isPrimary: false,
                      content: "Sign Up",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
