import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'iq_screen.dart';
import 'eq_screen.dart';
import 'sq_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IQEQSQ App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const HomeScreen()),
        GetPage(name: '/iq', page: () => const IQScreen()),
        GetPage(name: '/eq', page: () => const EQScreen()),
        GetPage(name: '/sq', page: () => const SQScreen()),
      ],
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IQEQSQ App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/iq');
              },
              child: const Text('IQ Test'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/eq');
              },
              child: const Text('EQ Test'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/sq');
              },
              child: const Text('SQ Test'),
            ),
          ],
        ),
      ),
    );
  }
}
