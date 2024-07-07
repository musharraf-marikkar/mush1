import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../SignInWithEmail/SignInWithEmail.dart';
import '../SignUp/SelectUserType.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo Top Container
              Flexible(
                flex: 2,
                child: Center(
                  child: Image.asset(
                    "assets/images/DFU_Logo.jpg",
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Bottom Container
              Flexible(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Title text
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          text: 'Empower Your Wellness Journey',
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF000000),
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    ),

                    // Text content
                    const Text(
                      'Welcome to DFU Foot Monitoring System, Track Your \nHealing Journey with Precision and Care',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xFF333333),
                      ),
                    ),

                    // Gap
                    const SizedBox(height: 40.0),

                    // Sign-in buttons
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Get.to(SignInWithEmail());
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(
                                MediaQuery.of(context).size.width * 0.8, 45),
                            backgroundColor: Colors.white,
                            side: const BorderSide(color: Colors.grey),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: const Text(
                            'Sign In using email',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),

                        //Gap
                        const SizedBox(height: 8.0),

                        ElevatedButton(
                          onPressed: () {
                            Get.to(const SelectUserType());
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(
                                MediaQuery.of(context).size.width * 0.8, 45),
                            backgroundColor: Colors.white,
                            side: const BorderSide(color: Colors.grey),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: const Text(
                            'Create Account',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),

                        //Gap
                        const SizedBox(height: 8.0),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
