import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:test_event/views/home_screen.dart';
import '../controllers/navigation_controller.dart';
import 'event_log_screen.dart';

class MainPage extends StatelessWidget {
  final navController = Get.put(NavigationController());

  final List<Widget> pages = [
    HomeScreen(),
    EventLogScreen(),
  ];

  final items = <Widget>[
    Icon(Icons.home, size: 30),
    Icon(Icons.history, size: 30),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          extendBody: true, // Pour effet de transparence en bas
          body: pages[navController.currentIndex.value],
          bottomNavigationBar: CurvedNavigationBar(
            index: navController.currentIndex.value,
            height: 60.0,
            items: items,
            color: const Color.fromARGB(185, 3, 99, 178),
            buttonBackgroundColor: Colors.white,
            backgroundColor: Colors.transparent,
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 300),
            onTap: navController.changeTab,
          ),
        ));
  }
}
