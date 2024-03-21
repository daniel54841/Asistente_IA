import 'dart:math';

import 'package:reproductor_ia/controllers/base_controller.dart';
import 'package:reproductor_ia/persistencia/sqlInicialice.dart';
import 'package:reproductor_ia/utils/assets_route.dart';

import 'models/tienda.dart';

class HomeController extends BaseController {
  Map<String, List<Tienda>> dataBuy = {};
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

  List<Tienda> tienda = [];
  @override
  void onInit() {
    super.onInit();
    SqlInicialice.createDB();
    getDataBuy();
  }

  //cargar la lista de datos para comprar( lista de listas)
  Future<void> getDataBuy() async {
    tienda = await SqlInicialice.getTodasLasTiendas();
    update();
  }

  //obtener la lista de items a partir de la posicion
  List<Tienda> getItems(int pos) {
    return dataBuy.values.toList()[pos];
  }

  Future<void> createTienda() async {
    await SqlInicialice.insertTienda(Tienda("Mercadona", false, []));
  }
}
