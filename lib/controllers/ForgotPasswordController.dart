// ignore_for_file: avoid_print, file_names

import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final TextEditingController ctrNewPassword = TextEditingController();
  final TextEditingController ctrConfirmPassword = TextEditingController();

  final FocusNode focusNodeNewPassword = FocusNode();
  final FocusNode focusNodeConfirmPassword = FocusNode();


  bool popScope() {
    return false;
  }
}
