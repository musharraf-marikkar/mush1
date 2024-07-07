import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget CustomTextInputField(
  String labelTitle,
  TextEditingController Controller, {
  double fontSize = 12.0,
  int maxLines = 1,
  bool obscureText = false,
  int keyBoardType = 1,
  context,
  double height = 50.0,
  FocusNode? CurrentFocusNod,
  FocusNode? NextFocusNode,
  Function()? OnSubmit,
  Widget? leadingIcon,
  Widget? trailingIcon,
  Function()? onTap,
  bool readOnly = false,
}) {
  return SizedBox(
    height: height,
    child: TextField(
      onTap: onTap,
      readOnly: readOnly,
      obscureText: obscureText,
      maxLines: maxLines,
      textAlignVertical: TextAlignVertical.bottom,
      textAlign: TextAlign.start,
      controller: Controller,
      focusNode: CurrentFocusNod,
      keyboardType:
          keyBoardType == 1 ? TextInputType.text : TextInputType.phone,
      onSubmitted: (value) {
        if (NextFocusNode != null) {
          FocusScope.of(context).requestFocus(NextFocusNode);
        }
        if (OnSubmit != null) {
          OnSubmit();
        }
      },
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.green, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.green),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.green),
        ),
        hintText: labelTitle,
        hintStyle: TextStyle(
          fontSize: fontSize,
          fontFamily: 'Poppins',
          color: Colors.grey,
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.italic,
        ),
        filled: true,
        fillColor: Colors.white.withOpacity(0.6),
        prefixIcon: leadingIcon,
        suffixIcon: trailingIcon,
      ),
      style: TextStyle(
        fontSize: fontSize,
        fontFamily: 'Poppins',
        color: Colors.black,
        fontStyle: FontStyle.normal,
      ),
    ),
  );
}
