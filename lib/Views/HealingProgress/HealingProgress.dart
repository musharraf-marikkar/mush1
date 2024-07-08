// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pentacode/Views/HealingProgress/healinglevel.dart';
import 'package:pentacode/Views/HealingProgress/lineChart.dart';
import 'package:pentacode/Views/SignInWithEmail/SignInWithEmail.dart';
import 'package:pentacode/configs/CommonFunctions.dart';
import 'package:pentacode/configs/Constants.dart';


class HealingProgress extends StatelessWidget {
  const HealingProgress({Key? key});

  Future<List<HealingLevels>> fetchHealingLevels() async {
    // Simulate fetching data from a database
    // Replace this section with your API call to fetch data from the database
    return [
      HealingLevels(x: DateTime(2023, 7, 1), y: 5.0),
      HealingLevels(x: DateTime(2023, 7, 2), y: 7.0),
      HealingLevels(x: DateTime(2023, 7, 3), y: 9.0),
      HealingLevels(x: DateTime(2023, 7, 4), y: 6.0),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Healing Progress',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(20.0),
          ),
          child: AppBar(
            
            title: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Healing Progress",
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Adjust the padding as needed
        child: Center(
          child: FutureBuilder<List<HealingLevels>>(
            future: HealingProgress().fetchHealingLevels(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Text('No data available');
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LineChartWidget(snapshot.data!),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/makeappointment'); 
                      },
                      child: const Text('Make Appointment'),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}