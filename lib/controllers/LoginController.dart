// ignore_for_file: avoid_print, file_names

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pentacode/Views/Dashboard/DashboardScreen.dart';
import 'package:pentacode/Views/Dashboard/DashboardScreendoctor.dart';
import 'package:pentacode/Views/Home/HomeScreen.dart';
import 'package:pentacode/Views/SignInWithEmail/SignInWithEmail.dart';
import 'package:pentacode/configs/CommonFunctions.dart';

import '../API/API_UserInit.dart';
import '../configs/Constants.dart';

class LoginController extends GetxController {
  final TextEditingController ctrUserName = TextEditingController();
  final TextEditingController ctrPassword = TextEditingController();
  final FocusNode focusNodeUserName = FocusNode();
  final FocusNode focusNodePassword = FocusNode();

  RxBool isEmpty = true.obs;

  bool popScope() {
    return false;
  }

  Future<void> onPressLogin() async {
  if (ctrUserName.text.isEmpty) {
    Get.snackbar('Login Failed', 'Please Enter the Username');
  } else if (ctrPassword.text.isEmpty) {
    Get.snackbar('Login Failed', 'Please Enter the Password');
  } else {
    debugPrint('Checking User..');

    await API_LoginVerify(
      false, ctrUserName.text.trim(), ctrPassword.text.trim(),
      (success, data, message) async {
        debugPrint('Login Verify Success: $success   Message: $message  Data: $data');
        if (success) {
          SetSharedPref(1, Constants.KEY_ACCESSTOKEN, data['token']);
          SetSharedPref(1, Constants.KEY_MEMBER_DATA, jsonEncode(data['loggedUser']));
          print('Login Success');

          String role = data['loggedUser']['role']; // Assuming 'role' is a field in the user data

          if (role == 'PATIENT') {
            Get.to(const DashboardScreen());
          } else if (role == 'DOCTOR') {
            Get.to(const DashboardScreendoctor());
          } else {
            Get.snackbar('Login Failed', 'Unknown user type');
          }
        } else {
          print('Login Failed');
          Get.snackbar('Login Failed', message);
        }
      }
    );
  }
}

  Future<void> onLogout() async {
    await API_Logout((success, data, message) async {
      if (success) {
        print('Logout Success');
        await RemoveSharedPref(Constants.KEY_ACCESSTOKEN);
        await RemoveSharedPref(Constants.KEY_MEMBER_DATA);
        Get.off(SignInWithEmail());
      } else {
        print('Logout Failed');
        Get.snackbar('Logout Failed', message);
      }
    });
  }

// onPressForgotPassword(){
// Get.to(()=>ForgotPasswordScreen());
// }

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
