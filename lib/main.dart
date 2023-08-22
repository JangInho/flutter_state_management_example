import 'package:flutter/material.dart';
import 'package:flutter_state_management_example/pages/obx_example.dart';
import 'package:get/get.dart';

import 'pages/get_builder_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StateManagementExample(),
    );
  }
}

class StateManagementExample extends StatelessWidget {
  const StateManagementExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Management Example'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {
              Get.to(const GetBuilderExample());
            }, child: const Text('GetBuilder Example')),

            ElevatedButton(onPressed: () {
              Get.to(const ObxExample());
            }, child: const Text('Obx Example')),

            ElevatedButton(onPressed: () {
              Get.to(const GetBuilderExample());
            }, child: const Text('GetX Example')),
          ],
        ),
      ),
    );
  }
}

