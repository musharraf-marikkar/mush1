// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pentacode/Views/SignUp/SignUpInformation.dart';
import 'package:pentacode/controllers/SignupController.dart';

import '../../Widgets/CustomButton.dart';
import '../../Widgets/InputField.dart';

class SignUpPassword extends StatelessWidget {
  final passwordController = Get.put(SignupController());

  final String _email = ""; // Store entered email
  final bool _showWarning = false;

  SignUpPassword({super.key}); // Flag to control warning visibility

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
              'Create a password',
              style: TextStyle(fontSize: 14.0),
            ),
            const SizedBox(height: 5.0),
            CustomTextInputField(
                'Please enter your Password', passwordController.ctrPassword,
                CurrentFocusNod: passwordController.focusNodePassword,
                obscureText: true,
                trailingIcon: const Icon(
                  Icons.lock_rounded,
                  color: Colors.lightGreen,
                  size: 20,
                ),
                context: context),
            const SizedBox(height: 8.0),
            const VerificationText(),
            const SizedBox(height: 16.0),
            Center(
              child: CustomButton(
                  'Next',
                  btnColor: const Color(0xFF00A482),
                  () {

                    if(passwordController.ctrPassword.text.length < 8){
                      Get.snackbar('Password Error', 'Password must be at least 8 characters long');
                      return;
                    }
                    Get.to(SignUpInformation());
                  },
                  btnRadius: 18,
                  // btnWidth: 80,
                  btnHeight: 40),
            ),
            Visibility(
              // Show warning only when _showWarning is true
              visible: _showWarning,
              child: const Text(
                'Use at least 8 characters.',
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
      'Use at least 8 characters.',
      style: TextStyle(fontSize: 12.0, color: Colors.grey),
    );
  }
}
