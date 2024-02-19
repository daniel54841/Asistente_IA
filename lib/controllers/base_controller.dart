import 'dart:math';

import 'package:get/get.dart';

import '../utils/assets_route.dart';

class BaseController extends GetxController {
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
