import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/global_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => globalController.checkLoading().isTrue
              ? const Center(child: CircularProgressIndicator())
              : Container(
                  child: const Text(
                    "Lucknow",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 30,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
