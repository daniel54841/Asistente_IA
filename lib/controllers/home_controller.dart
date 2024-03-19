import 'dart:math';

import 'package:get/get.dart';
import 'package:reproductor_ia/utils/assets_route.dart';

import 'models/Buy.dart';

class HomeController extends GetxController {
  Map<String, List<Buy>> dataBuy = {};
  //cargar la imagen aleatoria de la pantalla vacia cuando
  //esta vacia las listas
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

  @override
  void onInit() {
    super.onInit();
    getDataBuy();
  }

  //cargar la lista de datos para comprar( lista de listas)
  void getDataBuy() {
    Buy buy1 = Buy(nombre: "Fruteria");
    Buy buy2 = Buy(nombre: "Mercadona");
    dataBuy.putIfAbsent(buy1.nombre!, () => [buy1]);
    /*  dataBuy.putIfAbsent(buy2.nombre!, () => [buy2]);
    dataBuy.putIfAbsent("", () => [Buy(nombre: '')]);*/
    update();
  }

  //obtener la lista de items a partir de la posicion
  List<Buy> getItems(int pos) {
    return dataBuy.values.toList()[pos];
  }
}
