import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'screens/dashboard/dashboard.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
 // MobileAds.instance.initialize();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    GetMaterialApp(
      home: const MyApp(),
      theme: ThemeData(primaryColor: Colors.green, primarySwatch: Colors.green),
    ),
  );
}

// const String adUnitID = 'ca-app-pub-3940256099942544/6300978111';
// const int maxFailedLoadAttempts = 3;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const DashBoard();
  }
}
