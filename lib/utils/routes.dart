import 'package:e_commerce/pages/auth.dart';
import 'package:e_commerce/pages/cart.dart';
import 'package:e_commerce/pages/home.dart';
import 'package:e_commerce/pages/landing.dart';
import 'package:get/get.dart';

appRoutes() {
  return [
    GetPage(
      name: "/Landing",
      page: () => LandingScreen(),
    ),
    GetPage(
      name: "/Auth",
      page: () => AuthScreen(),
    ),
    GetPage(
      name: "/Home",
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: "/Cart",
      page: () => CartScreen(),
    ),
    GetPage(
      name: "/Details",
      page: () => CartScreen(),
    ),
  ];
}
