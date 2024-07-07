// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:pentacode/Views/SignInWithEmail/SignInWithEmail.dart';
import 'package:pentacode/Views/SignUp/SignUpPassword.dart';
import 'package:pentacode/controllers/SignupController.dart';

import '../../Widgets/CustomButton.dart';
import '../../Widgets/InputField.dart';

class SignUpOtp extends StatelessWidget {
  final emailController = Get.put(SignupController());

  final String _email = ""; // Store entered email
  final bool _showWarning = false;

  SignUpOtp({super.key});

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
              'Enter the Otp',
              style: TextStyle(fontSize: 24.0),
            ),
            const SizedBox(height: 16.0),
            OtpTextField(
              numberOfFields: 4,
              borderColor: const Color(0xFF00A482),
              borderWidth: 2,
              showFieldAsBox: true,
              onCodeChanged: (String code) {},
              onSubmit: (String verificationCode) {
                emailController.otp = verificationCode;
                emailController.onVerifyOTP();
              }, // end onSubmit
            ),

            const SizedBox(height: 8.0), // Spacing between elements
            const VerificationText(), // Separate widget for verification text
            const SizedBox(height: 16.0), // Spacing before button
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 16.0),
                  CustomButton('Verify your email',
                      btnColor: const Color(0xFF00A482), () {
                    if (emailController.otp.length < 4) {
                      Get.snackbar(
                          'OTP Error', 'OTP must be 4 characters long');
                      return;
                    }
                    emailController.onVerifyOTP();
                  },
                      btnRadius: 18,
                      // btnWidth: 80,
                      btnHeight: 40),
                  const SizedBox(height: 16.0),
                  TextButton(
                    onPressed: () => emailController.onSignup(),
                    child: const Text(
                      'Try Again',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
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
            // Visibility(
            //   // Show warning only when _showWarning is true
            //   visible: _showWarning,
            //   child: const Text(
            //     'Please enter your email address.',
            //     style: TextStyle(color: Colors.red, fontSize: 12.0),
            //   ),
            // ),
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
    SignupController emailController = Get.put(SignupController());
    return Text(
      'To confirm your registration with Pentacode, enter the 6-digit code \nwe sent to ${emailController.ctrEmail.text.trim()}',
      style: const TextStyle(fontSize: 12.0, color: Colors.grey),
      textAlign: TextAlign.center,
    );
  }
}
