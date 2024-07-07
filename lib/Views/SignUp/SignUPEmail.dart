// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pentacode/Views/SignUp/SignUpPassword.dart';
import 'package:pentacode/controllers/SignupController.dart';

import '../../Widgets/CustomButton.dart';
import '../../Widgets/InputField.dart';

class SignUpEmail extends StatelessWidget {
  final emailController = Get.put(SignupController());

  final String _email = ""; // Store entered email
  final bool _showWarning = false;

  SignUpEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'What is your email?',
              style: TextStyle(fontSize: 14.0),
            ),
            const SizedBox(height: 5.0),

            CustomTextInputField(
                'Enter your email address', emailController.ctrEmail,
                CurrentFocusNod: emailController.focusNodeEmail,
                trailingIcon: const Icon(
                  Icons.email_rounded,
                  color: Colors.lightGreen,
                  size: 20,
                ),
                context: context),
            const SizedBox(height: 8.0), // Spacing between elements
            const VerificationText(), // Separate widget for verification text
            const SizedBox(height: 15.0), // Spacing between elements
            const Text(
              'What is your Mobile Number with country code?',
              style: TextStyle(fontSize: 14.0),
            ),
            const SizedBox(height: 5.0),
            CustomTextInputField(
                'Enter your mobile number   ex:- +94777123456', emailController.ctrlMobile,
                keyBoardType: 0,
                trailingIcon: const Icon(
                  Icons.call_rounded,
                  color: Colors.lightGreen,
                  size: 20,
                ),
                context: context),
            const SizedBox(height: 16.0), // Spacing before button
            Center(
              child:
                  CustomButton('Next', btnColor: const Color(0xFF00A482), () {
                if (emailController.ctrEmail.text.isEmpty) {
                  Get.snackbar('Error', 'Please enter your email address');
                } else if (!(emailController.ctrEmail.text.contains('@') &&
                    emailController.ctrEmail.text.contains('.'))) {
                  Get.snackbar('Error', 'Please enter valid email address');
                } else if (!(emailController.ctrlMobile.text.contains('+') &&
                    emailController.ctrlMobile.text.length <= 13 &&
                    emailController.ctrlMobile.text.length > 9)) {
                  Get.snackbar('Error', 'Please enter valid mobile number with country code');
                } else {
                  Get.to(SignUpPassword());
                }
              },
                      btnRadius: 18,
                      // btnWidth: 80,
                      btnHeight: 40),
            ),
            //   ElevatedButton(
            //     onPressed: () {
            //       // setState(() {
            //       //   _showWarning =
            //       //       _email.isEmpty; // Set warning flag based on empty email
            //       // });
            //       if (_email.isNotEmpty) {
            //         // Handle valid email case (you can add logic here)
            //         print('Email: $_email');
            //       }
            //     },
            //     child: const Text('Next'),
            //     style: ElevatedButton.styleFrom(
            //       foregroundColor: Colors.white,
            //       backgroundColor: Colors.green,
            //     ),
            //   ),
            // ),
            Visibility(
              // Show warning only when _showWarning is true
              visible: _showWarning,
              child: const Text(
                'Please enter your email address.',
                style: TextStyle(color: Colors.red, fontSize: 12.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VerificationText extends StatelessWidget {
  const VerificationText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'You should verify your email address later',
      style: TextStyle(fontSize: 12.0, color: Colors.grey),
    );
  }
}
