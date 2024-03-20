import 'dart:math';

import 'package:reproductor_ia/controllers/base_controller.dart';
import 'package:reproductor_ia/persistencia/sqlInicialice.dart';
import 'package:reproductor_ia/utils/assets_route.dart';

import 'models/compra.dart';
import 'models/tienda.dart';

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

  /*@override
  void dispose() {
    super.dispose();
    SqlInicialice.closeDB();
  }*/

  //cargar la lista de datos para comprar( lista de listas)
  Future<void> getDataBuy() async {
    Tienda tienda = Tienda("Mercadona", false);
    await SqlInicialice.insertTienda(tienda);
    update();
  }

  //obtener la lista de items a partir de la posicion
  List<Compra> getItems(int pos) {
    return dataBuy.values.toList()[pos];
  }
}
