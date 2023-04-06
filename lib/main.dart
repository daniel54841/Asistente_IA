import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reproductor_ia/views/home/home_view.dart';
import 'package:reproductor_ia/views/login/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/login",
      getPages: [
        GetPage(
          name: "/login",
          page: () => LoginView(),
        ),
        GetPage(
          name: "/home",
          page: () => HomeView(),
        )
      ],
    );
  }
}
