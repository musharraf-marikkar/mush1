import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../controllers/DashboardController.dart';
import '../../styles/AppColors.dart';
import '../../styles/CommonStyles.dart';
import '../Dashboard/DashboardScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    DashboardController ctrDashboard = Get.put(DashboardController());
    List<Widget> widgets = [
      const DashboardScreen(),
      const Placeholder(),
      const Placeholder(),
    ];
    List<BottomNavigationBarItem> items = const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(
          Icons.home_outlined,
        ),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.line_style_rounded),
        label: 'History',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: 'Settings',
      ),
    ];
    return PopScope(
      onPopInvoked: (pop) {
        SystemNavigator.pop();
      },
      child: Scaffold(
        body: widgets[ctrDashboard.currentIndex.value],
        bottomNavigationBar:
            // Observe changes in currentIndex
            BottomNavigationBar(
          currentIndex: ctrDashboard.currentIndex.value,
          // ignore: prefer_const_constructors
          selectedItemColor: Color(0xFF00A482),
          backgroundColor: Colors.white,
          unselectedItemColor: AppColors.PRIMARY_GREY,
          selectedLabelStyle: TextStyle(fontWeight: Styles.MEDIUM),
          onTap: (value) => setState(() => ctrDashboard.onItemTapped(value)),
          items: items,
        ),
      ),
    );
  }
}
