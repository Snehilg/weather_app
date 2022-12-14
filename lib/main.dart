import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomeScreen(),
      title: "Weathery",
      debugShowCheckedModeBanner: false,
    );
  }
}
