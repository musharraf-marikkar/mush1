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

class DashboardScreendoctor extends StatelessWidget {
  const DashboardScreendoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                          onPressed: () => Get.back(),
                          child: const Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () async {
                            Get.back();
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
                  // Top 3 containers
                  SizedBox(
                    height: 420,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // View Patient Records Container
                        InkWell(
                          onTap: () {
                            Get.toNamed('/viewpatient');
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
                                      Icons.folder_open,
                                      color: Color.fromARGB(255, 190, 176, 51),
                                    ),
                                    Text(
                                      "View Patient Details",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      textAlign: TextAlign.left,
                                      "View patient medical \nrecords and treatment history",
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
                        // Monitor Wound Healing Container
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
                                      Icons.health_and_safety,
                                      color: Color.fromARGB(255, 165, 16, 6),
                                    ),
                                    Text(
                                      "Monitor Wound Healing",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      textAlign: TextAlign.left,
                                      "Provides visual updates and analysis \non the wound healing progress",
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
                        ),
                      ],
                    ),
                  ),
                                                    ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}