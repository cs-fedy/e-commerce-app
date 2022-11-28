import 'package:e_commerce/pages/auth.dart';
import 'package:e_commerce/pages/home.dart';
import 'package:get/get.dart';

appRoutes() {
  return [
    GetPage(
      name: "/Auth",
      page: () => AuthScreen(),
    ),
    GetPage(
      name: "/Home",
      page: () => HomeScreen(),
    )
  ];
}
