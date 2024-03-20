import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:reproductor_ia/controllers/login_controller.dart';
import 'package:reproductor_ia/utils/routes/custom_routes.dart';

import 'controllers/home_controller.dart';
import 'controllers/list_buy_item_controller.dart';

Future<void> main() async {
  Get.put(LoginController());
  Get.put(HomeController());
  Get.put(ListBuyItemController());
  //Firebase inicializacion
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/home",
      getPages: CustomRoutes.getListRoutes(),
    );
  }
}
