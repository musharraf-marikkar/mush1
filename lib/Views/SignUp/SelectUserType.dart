// SelectUserType.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pentacode/controllers/SignupController.dart';
import '../../Widgets/CustomButton.dart';
import 'SignUpEmail.dart'; // Import the SignUpEmail file

class SelectUserType extends StatefulWidget {
  const SelectUserType({super.key});

  @override
  State<SelectUserType> createState() => _SelectUserTypeState();
}

class _SelectUserTypeState extends State<SelectUserType> {
  bool _isPatientSelected = false;
  bool _isDoctorSelected = false;

  Color _buttonColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    SignupController signupController = Get.put(SignupController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gap
              const SizedBox(height: 16.0),

              const Text(
                'I am a',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),

              // Gap
              const SizedBox(height: 16.0),

              // Selection Containers
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _isPatientSelected = !_isPatientSelected;
                          _isDoctorSelected = false;
                          _buttonColor = _isPatientSelected
                              ? const Color(0xFF00A482)
                              : Colors.grey;
                        });
                        signupController.userTypeSelect(_isDoctorSelected);
                      },
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: _isPatientSelected
                                ? const Color(0xFF00A482)
                                : Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.person,
                              color: _isPatientSelected
                                  ? const Color(0xFF00A482)
                                  : Colors.grey,
                              size: 40,
                            ),
                            const SizedBox(width: 8.0),
                            const Text(
                              'Patient',
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  //Gap
                  const SizedBox(width: 16.0),

                  Flexible(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _isDoctorSelected = !_isDoctorSelected;
                          _isPatientSelected = false;
                          _buttonColor = _isDoctorSelected
                              ? const Color(0xFF00A482)
                              : Colors.grey; // Update button color
                        });

                        signupController.userTypeSelect(_isDoctorSelected);
                      },
                      child: Container(
                        height: 60, // Make the container taller
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: _isDoctorSelected
                                ? const Color(0xFF00A482)
                                : Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.medical_services,
                              color: _isDoctorSelected
                                  ? const Color(0xFF00A482)
                                  : Colors.grey,
                              size:
                                  40, // Adjust icon size based on screen width
                            ),
                            const SizedBox(width: 8.0),
                            const Text(
                              'Doctor',
                              style: TextStyle(
                                  fontSize: 18.0), // Increase text size
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40.0), // Adjust spacing as needed
              Center(
                child:
                    // CustomButton(
                    //       'LOGIN', () => loginController.onPressLogin(),
                    //       btnHeight: 40),
                    ElevatedButton(
                  onPressed: _isPatientSelected || _isDoctorSelected
                      ? () {
                          if (signupController.isDoctor == null) {
                            Get.snackbar('Error', 'Please select a user type');
                          } else {
                            Get.to(() => SignUpEmail());
                          }
                        }
                      : null,
                  style: ButtonStyle(
                    padding: WidgetStateProperty.all(
                      const EdgeInsets.symmetric(
                          horizontal: 60.0, vertical: 18.0),
                    ),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: const BorderSide(
                            color: Color.fromRGBO(255, 255, 255, 0.21)),
                      ),
                    ),
                    backgroundColor: WidgetStateProperty.all(
                        _buttonColor), // Dynamically set button color
                    shadowColor: WidgetStateProperty.all(
                        const Color.fromRGBO(0, 0, 0, 0.25)),
                    elevation: WidgetStateProperty.all(4), // Box shadow
                  ),
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      color: Color(0xFFF9FAFB),
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      height: 1.6, // 160%
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
