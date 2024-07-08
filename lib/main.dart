import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pentacode/Views/Dashboard/DashboardScreen.dart';
import 'package:pentacode/Views/Dashboard/DashboardScreendoctor.dart';
import 'package:pentacode/Views/MakeAppointment/home_page.dart';
import 'package:pentacode/Views/Viewpatient/viewpatient.dart';
import 'package:pentacode/Views/HealingProgress/HealingProgress.dart'; // Import the HealingProgress file
import 'Views/SplashScreen/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pentacode',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      getPages: [
        GetPage(name: '/dashboard', page: () => const DashboardScreen()),
        GetPage(name: '/dashboardDoctor', page: () => const DashboardScreendoctor()),
        GetPage(name: '/healingProgress', page: () => const HealingProgress()),
        GetPage(name: '/viewpatient', page: () => const ViewPatient()),
        GetPage(name: '/makeappointment', page: () => const HomePage()),
      ],
      home: SplashScreen(),
    );
  }
}