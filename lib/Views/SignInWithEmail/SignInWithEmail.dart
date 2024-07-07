import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pentacode/Views/ForgotPassword/ForgotPassword.dart';
import 'package:pentacode/Widgets/InputField.dart';
import 'package:pentacode/configs/common_Exports.dart';
import 'package:pentacode/controllers/LoginController.dart';
import 'package:pentacode/views/Dashboard/DashboardScreen.dart';

import '../../Widgets/CustomButton.dart';

// ignore: must_be_immutable
class SignInWithEmail extends StatelessWidget {
  SignInWithEmail({super.key});

  final loginController = Get.put(LoginController());

  final _formKey = GlobalKey<FormState>();
  final String _email = '';
  final String _password = '';

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In'),
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
                //NewPassword
                SizedBox(
                    height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Email or username'),
                        CustomTextInputField(
                          'Enter Email or Username',
                          loginController.ctrUserName,
                          CurrentFocusNod: loginController.focusNodeUserName,
                          NextFocusNode: loginController.focusNodePassword,
                          trailingIcon: const Icon(
                            Icons.password_sharp,
                            color: Colors.lightGreen,
                            size: 20,
                          ),
                          context: context,
                        ),
                      ],
                    )),

                //ConfirmPassword
                SizedBox(
                    height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Password"),
                        CustomTextInputField(
                            'Enter Password', loginController.ctrPassword,
                            CurrentFocusNod: loginController.focusNodePassword,
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
                    'LOGIN',
                    btnColor: const Color(0xFF00A482),
                    // ignore: prefer_const_constructors
                    () async => await loginController.onPressLogin(),
                    btnRadius: 20,
                    btnHeight: 40),

                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                      onPressed: () => Get.to(ForgotPassword()),
                      child: const Text(
                        'Forgotten Password?',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Inter',
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
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
                