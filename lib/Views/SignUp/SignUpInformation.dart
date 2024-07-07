// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pentacode/configs/common_Exports.dart';
import 'package:pentacode/controllers/SignupController.dart';
import 'package:pentacode/views/Dashboard/DashboardScreen.dart';

import '../../Widgets/CustomButton.dart';
import '../../Widgets/InputField.dart';

class SignUpInformation extends StatelessWidget {
  final informationController = Get.put(SignupController());

  final String _email = "";
  final bool _showWarning = false;

  SignUpInformation({super.key});

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Styles.sizebox20,
                Row(children: [
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'FirstName',
                          style: TextStyle(fontSize: 14.0),
                        ),
                          const SizedBox(height: 5.0),
                        CustomTextInputField('Enter your FirstName',
                            informationController.ctrFirstName,
                            CurrentFocusNod:
                                informationController.focusNodeFirstName,
                            obscureText: false,
                            trailingIcon: const Icon(
                              Icons.person_2_outlined,
                              color: Colors.lightGreen,
                            ),
                            context: context),
                      ],
                    ),
                  ),
                  Styles.sizebox20W,
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          textAlign: TextAlign.left,
                          'LastName',
                          style: TextStyle(fontSize: 14.0),
                        ),
                          const SizedBox(height: 5.0),
                        CustomTextInputField('Enter your LastName',
                            informationController.ctrLastName,
                            CurrentFocusNod:
                                informationController.focusNodeLastName,
                            trailingIcon: const Icon(
                              Icons.person_2_outlined,
                              color: Colors.lightGreen,
                            ),
                            obscureText: false,
                            context: context),
                      ],
                    ),
                  ),
                ]),
                Styles.sizebox30,
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Date of Birth',
                        style: TextStyle(fontSize: 14.0),
                      ),
                      const SizedBox(height: 5.0),
                      CustomTextInputField('Enter your Date of Birth',
                          informationController.ctrDateOfBirth,
                          readOnly: true,
                          onTap: () async{
                             DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2101),
                              );
                              if (pickedDate != null) {
                                informationController.ctrDateOfBirth.text =
                                    "${pickedDate.toLocal()}".split(' ')[0];
                              }
                          },
                          CurrentFocusNod:
                              informationController.focusNodeDateOfBirth,
                          obscureText: false,
                          trailingIcon: const Icon(
                              Icons.calendar_today,
                              color: Colors.lightGreen,
                            ),
                          context: context),
                    ],
                  ),
                ),
                Styles.sizebox30,
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Gender',
                        style: TextStyle(fontSize: 14.0),
                      ),
                      const SizedBox(height: 5.0),
                      DropdownButtonFormField(
                          style: const TextStyle(
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            fontStyle: FontStyle.normal,
                          ),
                          decoration:  InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.green, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.green),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.green),
                            ),
                          ),
                          hint: const Text("Please select a gender"),
                    
                          items: informationController.genderOptions
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            informationController.ctrGender.text = value.toString();
                          })
                    ],
                  ),
                ),
              ],
            ),
            Center(
              child:
                  CustomButton('Submit', btnColor: const Color(0xFF00A482), () async{
                if (informationController.ctrFirstName.text.isNotEmpty &&
                    informationController.ctrLastName.text.isNotEmpty &&
                    informationController.ctrDateOfBirth.text.isNotEmpty &&
                    informationController.ctrGender.text.isNotEmpty) {
                 await  informationController.onSignup();
                } else {
                  Get.snackbar('Error', 'Please fill all fields');
                }
              },
                      btnRadius: 15,
                      // btnWidth: 80,
                      btnHeight: 40),
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
