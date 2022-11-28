import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool isLoginSection = true.obs;

  toggleLogin() {
    isLoginSection(true);
  }

  toggleSignup() {
    isLoginSection(false);
  }
}
