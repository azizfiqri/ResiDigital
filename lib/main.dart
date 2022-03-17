import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:residigital/app/data/theme.dart';
import 'package:residigital/app/modules/home/views/splashscreen_view.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 3)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return GetMaterialApp(
            theme: ThemeData(
              appBarTheme: AppBarTheme(color: buttonColorBlue),
              buttonTheme: ButtonThemeData(
                buttonColor: buttonColorBlue,
              ),
            ),
            debugShowCheckedModeBanner: false,
            title: "Application",
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
          );
        }
        return FutureBuilder(
            builder: (context, snapshot) => SplashscreenView());
      },
    );
  }
}
