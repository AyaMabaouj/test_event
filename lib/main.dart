import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:test_event/controllers/event_controller.dart';
import 'package:test_event/views/event_log_screen.dart';
import 'package:test_event/views/home_screen.dart';
import 'package:test_event/views/main_page.dart';
import 'package:test_event/widgets/theme.dart';
void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
  apiKey: "AIzaSyDxy5y0J5QB8v5Ipa3tmxTxXFFP0VopuvM",
  authDomain: "testevent-64058.firebaseapp.com",
  projectId: "testevent-64058",
  storageBucket: "testevent-64058.firebasestorage.app",
  messagingSenderId: "959174549241",
  appId: "1:959174549241:web:bc67373a7e8f714e4d0c28",
  measurementId: "G-M69D3SP8GY" ));
    Get.put(EventController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return GetMaterialApp(
  title: 'Event Logger',
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    primarySwatch: customSwatch,
    scaffoldBackgroundColor: Colors.grey[100],
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontSize: 16),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: const Color.fromARGB(185, 3, 99, 178),
      foregroundColor: Colors.white,
      elevation: 2,
    ),
  ),
       home: MainPage(),

);

  }
}
