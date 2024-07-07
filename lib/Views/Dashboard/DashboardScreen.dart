import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pentacode/Views/HealingProgress/healinglevel.dart';
import 'package:pentacode/Views/SignInWithEmail/SignInWithEmail.dart';
import 'package:pentacode/Views/HealingProgress/HealingProgress.dart';
import 'package:pentacode/configs/CommonFunctions.dart';
import 'package:pentacode/configs/Constants.dart';
import 'package:pentacode/controllers/LoginController.dart';
import '../../styles/CommonStyles.dart';
import 'package:image_picker/image_picker.dart';

import '../UploadImage/UploadImage.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  Future<void> pickImage(ImageSource source, Function(String?) onImageSelected) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      onImageSelected(pickedImage.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());
    return Column(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(20.0),
          ),
          child: AppBar(
            leading: const Icon(Icons.home_rounded),
            toolbarHeight: 70.0,
            title: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Home",
                style: TextStyle(color: Colors.black),
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 8.0,
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Image.asset(
                  "assets/images/profile.jpg",
                  height: 40,
                ),
              ),
              const SizedBox(width: 10),
              IconButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: "Logout",
                    middleText: "Are you sure you want to logout?",
                    actions: [
                      TextButton(
                        onPressed: () async {
                          Get.back();
                        },
                        child: const Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () async {
                          Get.back();
                          //  await loginController.onLogout();
                          await RemoveSharedPref(Constants.KEY_ACCESSTOKEN);
                          await RemoveSharedPref(Constants.KEY_MEMBER_DATA);
                          Get.off(SignInWithEmail());
                        },
                        child: const Text("Logout"),
                      ),
                    ],
                  );
                },
                icon: const Icon(Icons.logout_rounded),
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Top 3 containers
                SizedBox(
                  height: 420,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                      onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: UploadImage(
                                  onImageSelected: (String? path) {
                                    // Handle image selection
                                    print('Selected image path: $path');
                                    Navigator.of(context).pop(); 
                                  },
                                  includeGallery: false,
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            color: Colors.lightBlue.withOpacity(0.3),
                            border: Border.all(
                              width: 0.5,
                              color: const Color.fromARGB(255, 10, 110, 181),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                          height: 120,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.qr_code_2_sharp,
                                    color: Color.fromARGB(255, 10, 110, 181),
                                  ),
                                  Text(
                                    "Scan",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    textAlign: TextAlign.left,
                                    "Enables Patient to use the scanner to collect \ndetailed data on their wound's condition",
                                    //style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_circle_right_outlined,
                                color: Color.fromARGB(255, 10, 110, 181),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: UploadImage(
                                  onImageSelected: (String? path) {
                                    // Handle image selection
                                    print('Selected image path: $path');
                                    Navigator.of(context).pop(); 
                                  },
                                  
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            color: Colors.yellow.withOpacity(0.3),
                            border: Border.all(
                              width: 0.5,
                              color: const Color.fromARGB(255, 190, 176, 51),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                          height: 120,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.file_upload_sharp,
                                    color: Color.fromARGB(255, 190, 176, 51),
                                  ),
                                  Text(
                                    "Upload",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    textAlign: TextAlign.left,
                                    "Allow patient to capture and upload images \nof their wounds for anlysis and tracking",
                                    //style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_circle_right_outlined,
                                color: Color.fromARGB(255, 190, 176, 51),
                              ),
                            ],
                          ),
                        ),
                      ),
                    InkWell(
  onTap: () {
    Get.toNamed('/healingProgress'); // Use Get.toNamed for navigation
  },
  child: Container(
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      color: Colors.red.withOpacity(0.3),
      border: Border.all(
        width: 0.5,
        color: const Color.fromARGB(255, 165, 16, 6),
      ),
    ),
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
    height: 120,
    child: const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.add_chart_sharp,
              color: Color.fromARGB(255, 165, 16, 6),
            ),
            Text(
              "Track Healing Progress",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              textAlign: TextAlign.left,
              "Provides visual representation and updates \non the healing status of the wound over time",
            ),
          ],
        ),
        Icon(
          Icons.arrow_circle_right_outlined,
          color: Color.fromARGB(255, 165, 16, 6),
        ),
      ],
    ),
  ),
)
                    ],
                  ),
                ),
                // Additional content
                Styles.sizebox20,
                const Text(
                  "Tips for Patients",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Styles.sizebox20,
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black38, width: 0.5),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    children: [
                      Styles.sizebox10W,
                      const Icon(
                        Icons.check_circle_outline_sharp,
                        color: Color(0xFF00A482),
                      ),
                      Styles.sizebox20W,
                      const Text("Keep the wound clean and dry."),
                    ],
                  ),
                ),
                Styles.sizebox10,
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black38, width: 0.5),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    children: [
                      Styles.sizebox10W,
                      const Icon(
                        Icons.check_circle_outline_sharp,
                        color: Color(0xFF00A482),
                      ),
                      Styles.sizebox20W,
                      const Text("Regularly change dressings as advised by your doctor."),
                    ],
                  ),
                ),
                Styles.sizebox10,
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black38, width: 0.5),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    children: [
                      Styles.sizebox10W,
                      const Icon(
                        Icons.check_circle_outline_sharp,
                        color: Color(0xFF00A482),
                      ),
                      Styles.sizebox20W,
                      const Text("Monitor for signs of infections, such as increased redness or swelling."),
                    ],
                  ),
                ),
                Styles.sizebox10,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
