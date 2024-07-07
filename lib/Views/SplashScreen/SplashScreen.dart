import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pentacode/controllers/SplashController.dart';


class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  // Initialize the SplashController
   final ctrSplash = Get.put(SplashController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF6FD883),
        child: Center(
          child: ClipOval(
            child: Image.asset(
                    "assets/images/DFU_Logo.jpg",
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
          ),
        ),
      ),
    );
  }
}
