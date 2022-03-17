import 'package:flutter/material.dart';

class SplashscreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Image.asset('lib/app/images/iot-laboratory-dark.png'),
        ),
      ),
    );
  }
}
