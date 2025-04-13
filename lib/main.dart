import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vire_glof/colors.dart';
import 'package:vire_glof/profile/contact_us.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Signup App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: AppColors.backgroundWhite,
      ),
      home: ContactUsScreen(),
    );
  }
}
