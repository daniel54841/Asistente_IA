import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reproductor_ia/controllers/base_controller.dart';
import 'package:reproductor_ia/persistencia/sqlInicialice.dart';

import '../widgets/dialogs/advertencia_custom_dialog.dart';
import 'models/busqueda.dart';

class ListController extends BaseController {
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
      SqlInicialice.insertNewBusqueda(busqueda);
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
      Get.dialog(
        barrierDismissible: false,
        AdvertenciaCustomDialog(
          title: "Advertencia",
          body: "Estas seguro de borrar los datos.\n Si continuas se eliminará la informacion de forma permanente.\n¿Deseas continuar?",
          onTap: () async {
            await SqlInicialice.deleteAllBusquedas();
            Get.back();
            contador = 0;
          },
        ),
      );
    } else {
      datos.clear();
    }

    update();
  }
}
