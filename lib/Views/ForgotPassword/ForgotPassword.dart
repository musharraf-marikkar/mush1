import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pentacode/Views/SignInWithEmail/SignInWithEmail.dart';
import 'package:pentacode/Widgets/InputField.dart';
import 'package:pentacode/configs/common_Exports.dart';
import 'package:pentacode/controllers/ForgotPasswordController.dart';
import 'package:pentacode/controllers/LoginController.dart';
import 'package:pentacode/views/Dashboard/DashboardScreen.dart';

import '../../Widgets/CustomButton.dart';

// ignore: must_be_immutable
class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

  final forgotPasswordController = Get.put(ForgotPasswordController());

  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: screenHeight -
                MediaQuery.of(context).padding.top -
                kToolbarHeight,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Styles.sizebox20,
                //username
                SizedBox(
                    height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('New Password'),
                        CustomTextInputField(
                          'Enter New Password',
                          forgotPasswordController.ctrNewPassword,
                          CurrentFocusNod:
                              forgotPasswordController.focusNodeNewPassword,
                          NextFocusNode:
                              forgotPasswordController.focusNodeConfirmPassword,
                          context: context,
                        ),
                      ],
                    )),

                //password
                SizedBox(
                    height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Confirm Password"),
                        CustomTextInputField('Confirm Password',
                            forgotPasswordController.ctrConfirmPassword,
                            CurrentFocusNod: forgotPasswordController
                                .focusNodeConfirmPassword,
                            obscureText: true,
                            trailingIcon: const Icon(
                              Icons.password_sharp,
                              color: Colors.lightGreen,
                              size: 20,
                            ),
                            context: context),
                      ],
                    )),

                CustomButton(
                    'Confirm',
                    btnColor: const Color(0xFF00A482),
                    // ignore: prefer_const_constructors
                    () => Get.to(SignInWithEmail()),
                    btnRadius: 20,
                    btnHeight: 40),
                
                // Expanded(
                //   child: Align(
                //     alignment: Alignment.bottomCenter,
                //     child: TextButton(
                //       onPressed: () {},
                //       child: const Text(
                //         'Forgotten Password?',
                //         style: TextStyle(
                //           color: Colors.black,
                //           fontFamily: 'Inter',
                //           fontSize: 14.0,
                //           fontWeight: FontWeight.w700,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


 






//  Form(
//                   key: _formKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Email or username',
//                         style: TextStyle(fontSize: screenHeight * 0.02, fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(height: screenHeight * 0.01),
//                       TextFormField(
//                         keyboardType: TextInputType.emailAddress,
//                         decoration: const InputDecoration(
//                           border: OutlineInputBorder(),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your email address.';
//                           }
//                           return null;
//                         },
//                         onSaved: (newValue) => _email = newValue!,
//                       ),
//                       SizedBox(height: screenHeight * 0.02),
//                       Text(
//                         'Password',
//                         style: TextStyle(fontSize: screenHeight * 0.02, fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(height: screenHeight * 0.01),
//                       TextFormField(
//                         obscureText: true, // Hide password input
//                         decoration: const InputDecoration(
//                           border: OutlineInputBorder(),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your password.';
//                           }
//                           return null;
//                         },
//                         onSaved: (newValue) => _password = newValue!,
//                       ),
//                       SizedBox(height: screenHeight * 0.03),
//                       Center(
//                         child: ElevatedButton(
//                           onPressed: () {
//                             // Validate form and attempt sign-in with email/password (replace with your logic)
//                             if (_formKey.currentState!.validate()) {
//                               _formKey.currentState!.save();
//                               // Sign in with email and password
//                               // ...
//                             }
//                           },
//                           style: ButtonStyle(
//                             padding: MaterialStateProperty.all(
//                               EdgeInsets.symmetric(horizontal: 40.0, vertical: 16.0), // Set the width of the button
//                             ),
//                             shape: MaterialStateProperty.all(
//                               RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(100.0), // Make the button round
//                               ),
//                             ),
//                             backgroundColor: MaterialStateProperty.all(const Color(0xFF00A482)), // Button background color
//                           ),
//                           child: const Text(
//                             'Log In',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 16.0,
//                               fontWeight: FontWeight.bold,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
                