import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../SignIn/SignIn.dart';

class AgreeToContinue extends StatelessWidget {
  const AgreeToContinue({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Gap
            const SizedBox(
              height: 20,
            ),

            //Logo Container
            Flexible(
              flex: 2,
              child: Center(
                child:  Image.asset(
                    "assets/images/DFU_Logo.jpg",
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
              ),
            ),

            //Bottom Text Container
            Flexible(
              flex: 1,
              child: Column(
                children: [
                  //Welcome Text
                  const Text(
                    'Welcome to DFU Foot\nMonitoring System',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF000000), // Black color using hex code
                      fontFamily: 'SF Pro', // Set font family
                      letterSpacing: 1.0, // Adjust letter spacing (optional)
                      height: 1.45, // Adjust line height (optional)
                    ),
                  ),

                  // Gap
                  const SizedBox(
                    height: 30,
                  ),

                  //Privacy policy text
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Please review our ',
                      style: const TextStyle(color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Privacy Policy',
                            style: const TextStyle(
                              color: Color(0xFF3972E4),
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => {}),
                        const TextSpan(text: '. By clicking\n'),
                        const TextSpan(
                          text: '“Agree & Continue,”',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const TextSpan(text: ' you consent to our '),
                        TextSpan(
                            text: 'Terms of Service.',
                            style: const TextStyle(
                              color: Color(0xFF3972E4),
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => {}),
                      ],
                    ),
                  ),

                  // Gap
                  const SizedBox(
                    height: 40,
                  ),

                  //Bottom Text Button
                  TextButton(
                    onPressed: () {
                      Get.to(const SignIn());
                    },
                    child: const Text(
                      'I Agree & Continue',
                      style: TextStyle(
                        color: Color(0xFF3972E4),
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
