// ignore_for_file: avoid_print, file_names

import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pentacode/API/API_UserInit.dart';
import 'package:pentacode/Views/SignInWithEmail/SignInWithEmail.dart';
import 'package:pentacode/Views/SignUp/SignUpOtp.dart';

class SignupController extends GetxController {
  final TextEditingController ctrEmail = TextEditingController();
  final TextEditingController ctrlMobile = TextEditingController();
  final TextEditingController ctrPassword = TextEditingController();
  final TextEditingController ctrFirstName = TextEditingController();
  final TextEditingController ctrLastName = TextEditingController();
  final TextEditingController ctrDateOfBirth = TextEditingController();
  TextEditingController ctrGender = TextEditingController();
  final FocusNode focusNodeEmail = FocusNode();
  final FocusNode focusNodePassword = FocusNode();
  final FocusNode focusNodeFirstName = FocusNode();
  final FocusNode focusNodeLastName = FocusNode();
  final FocusNode focusNodeDateOfBirth = FocusNode();
  final FocusNode focusNodeGender = FocusNode();

  RxBool isEmpty = true.obs;
  var selectedGender = ''.obs;
  RxList<String> genderOptions = ['Male', 'Female', 'Other'].obs;

  String otp = '';

  bool? isDoctor;

  void userTypeSelect(bool isDoctor) {
    this.isDoctor = isDoctor;
  }

  bool popScope() {
    return false;
  }
// onPressForgotPassword(){
// Get.to(()=>ForgotPasswordScreen());
// }

  onSignup() async {
    await API_RegisterUser(
        ctrFirstName.text.trim(),
        ctrLastName.text.trim(),
        ctrEmail.text.trim(),
        ctrPassword.text.trim(),
        ctrlMobile.text.trim(),
        ctrDateOfBirth.text.trim(),
        ctrGender.text.trim(),
        isDoctor == true ? 'Doctor' : 'Patient',
        (success, data, message) async {
      debugPrint(
          'Register Verify Success: $success   Message: $message  Data: $data');
      if (success) {
        print('Register Success');
        Get.snackbar("OTP SENT", message);
        Get.to(SignUpOtp());
      } else {
        print('Regsiter Failed');
        Get.snackbar('Register Failed', message);
      }
    });
  }

  onVerifyOTP() async {
    await API_VerifyOTP(ctrEmail.text.trim(), otp,
        (success, data, message) async {
      debugPrint(
          'Register Verify Success: $success   Message: $message  Data: $data');
      if (success) {
        print('Register Success');
        Get.snackbar("Registration Successs", message);
        Get.to(SignInWithEmail());
      } else {
        print('Regsiter Failed');
        Get.snackbar('Register Failed', message);
      }
    });
  }

  // Future<void> onPressLogin() async {
  //   try {
  //     if (ctrUserName.text.isEmpty) {
  //       ShowDialog('Please Enter the Username');
  //     } else if (ctrPassword.text.isEmpty) {
  //       ShowDialog('Please Enter the Password');
  //     } else {
  //       ShowLoading(message: 'Checking User..');

  //       await API_LoginVerify(false, ctrUserName.text, ctrPassword.text,
  //           (success,dynamic data, message) async {
  //         if (success) {
  //           //Save Member Details Object
  //           Constants.objMember = data;
  //           await SetSharedPref(
  //               1, Constants.KEY_MEMBERCODE, data['MembershipNo']);
  //           await SetSharedPref(2, Constants.KEY_MEMBERID, data['Id']);
  //           await SetSharedPref(
  //               1, Constants.KEY_MEMBERLOGINUUID, data['MemberLoginUUID']);

  //           HideLoading();
  //           Get.to(DashboardScreen());

  //         } else {
  //           print("Failed to obtain token.");
  //           HideLoading();
  //           ShowDialog(message);
  //         }
  //       });
  //       ctrPassword.clear();
  //       ctrUserName.clear();
  //     }
  //   } catch (e) {
  //     print(
  //         '======== EXCEPTION =====> \n [LoginController] - onPressLogin() $e ');
  //   }
  // }
}
