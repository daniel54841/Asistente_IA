import 'dart:math';

import 'package:get/get.dart';
import 'package:reproductor_ia/utils/assets_route.dart';

import 'models/Buy.dart';

class HomeController extends GetxController {
  List<Buy> dataBuy = [];

  String getLoadEmptyList() {
    int opcion = Random().nextInt(2) + 0;

    if (opcion == 0) {
      return AssetsRoute.animationEmptyPath("fresa");
    } else if (opcion == 1) {
      return AssetsRoute.animationEmptyPath("Multiple");
    } else {
      return AssetsRoute.animationEmptyPath("naranja");
    }
  }
}
