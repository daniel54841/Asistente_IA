import 'dart:math';

import 'package:reproductor_ia/controllers/base_controller.dart';
import 'package:reproductor_ia/persistencia/sqlInicialice.dart';
import 'package:reproductor_ia/utils/assets_route.dart';

import 'models/compra.dart';

class HomeController extends BaseController {
  Map<String, List<Compra>> dataBuy = {};
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
    SqlInicialice.createDB();
    getDataBuy();
  }

  //cargar la lista de datos para comprar( lista de listas)
  void getDataBuy() {
    Compra buy1 = Compra(nombre: "Fruteria");
    Compra buy2 = Compra(nombre: "Mercadona");
    dataBuy.putIfAbsent(buy1.nombre!, () => [buy1]);
    /*  dataBuy.putIfAbsent(buy2.nombre!, () => [buy2]);
    dataBuy.putIfAbsent("", () => [Buy(nombre: '')]);*/
    update();
  }

  //obtener la lista de items a partir de la posicion
  List<Compra> getItems(int pos) {
    return dataBuy.values.toList()[pos];
  }
}
