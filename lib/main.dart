import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'iq_screen.dart';
import 'eq_screen.dart';
import 'sq_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
        GetPage(name: '/', page: () => HomeScreen()),
        GetPage(name: '/iq', page: () => IQScreen()),
        GetPage(name: '/eq', page: () => EQScreen()),
        GetPage(name: '/sq', page: () => SQScreen()),
      ],
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IQEQSQ App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/iq');
              },
              child: Text('IQ Test'),
            ),
            // SizedBox(height: 16),
            // ElevatedButton(
            //   onPressed: () {
            //     Get.toNamed('/eq');
            //   },
            //   child: Text('EQ Test'),
            // ),
            // SizedBox(height: 16),
            // ElevatedButton(
            //   onPressed: () {
            //     Get.toNamed('/sq');
            //   },
            //   child: Text('SQ Test'),
            // ),
          ],
        ),
      ),
    );
  }
}
