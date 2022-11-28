import 'package:e_commerce/components/wrapper.dart';
import 'package:e_commerce/utils/constants.dart';
import 'package:e_commerce/utils/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'E-commerce app',
      theme: ThemeData(
        primaryColor: primaryColor,
        backgroundColor: bgColor,
      ),
      debugShowCheckedModeBanner: false,
      // initialBinding: StoreBinding(),
      home: WrapperScreen(),
      getPages: appRoutes(),
    );
  }
}
