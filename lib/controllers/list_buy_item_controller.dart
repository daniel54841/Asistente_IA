import 'package:flutter/material.dart';
import 'package:reproductor_ia/controllers/base_controller.dart';
import 'package:reproductor_ia/persistencia/sqlInicialice.dart';

import 'models/busqueda.dart';

class ListBuyItemController extends BaseController {
  late List<Busqueda> datos;
  int contador = 0;
  @override
  void onInit() {
    super.onInit();
    _initializeListadoBusqueda();
  }

  Future<void> _initializeListadoBusqueda() async {
    datos = await SqlInicialice.getProductosBusqueda();
    update();
  }

  Future<bool> haveAnyItem(String textoBuscado) async {
    //actualizamos el listado de productos
    datos = await SqlInicialice.getProductosBusqueda();
    if (textoBuscado.isNotEmpty) {
      Busqueda busqueda = Busqueda(producto: textoBuscado);
      SqlInicialice.insertOrUpdateNewBusqueda(busqueda);
    } else {
      const SnackBar(
        content: Text("No se puede añadir un elemento vacio"),
      );
    }
    update();
    if (datos.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  void cleanOnlyUIItems() {
    contador++;
    if (contador == 2) {
    } else {
      datos.clear();
    }

    update();
  }
}
