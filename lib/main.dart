import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pentacode/Views/Dashboard/DashboardScreen.dart';
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
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/healingProgress', page: () => HealingProgress()),
      ],
      home: SplashScreen(),
    );
  }
}