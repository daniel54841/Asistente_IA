import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:reproductor_ia/controllers/base_controller.dart';
import 'package:reproductor_ia/persistencia/sqlInicialice.dart';
import 'package:reproductor_ia/utils/assets_route.dart';
import 'package:reproductor_ia/utils/constants/home_constants.dart';
import 'package:reproductor_ia/utils/responsive.dart';

import '../utils/constants/general_constants.dart';
import '../widgets/dialogs/info_custom_dialog.dart';
import 'models/tienda.dart';

class HomeController extends BaseController {
  bool isFavorite = false;
  bool isTemporal = false;
  bool changeVista = false;

  TextEditingController etCtrl = TextEditingController();

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

  Future<void> createTienda(bool isFavorite, Responsive responsive) async {
    if (etCtrl.text != "") {
      bool tiendaIsRepeat = await comprobarRepeticion(etCtrl.text);
      if (!tiendaIsRepeat) {
        isFavorite = false;
        etCtrl.clear();
        bool finish = await SqlInicialice.insertTienda(Tienda(etCtrl.text, isFavorite, []));
        if (finish) {
          Get.dialog(
            barrierDismissible: false,
            InfoCustomDialog(
              title: GeneralConstants.titleDialogInfo,
              body: HomeConstants.labelInfoTiendaCreadaCorrectamente,
              titleButton: GeneralConstants.labelButtonDialogInfo,
              route: "/home",
            ),
          );
        } else {
          InfoCustomDialog(
            title: GeneralConstants.titleDialogInfo,
            body: HomeConstants.labelErrorTiendaCreada,
            titleButton: GeneralConstants.labelButtonDialogInfo,
          );
        }
      } else {
        Get.dialog(
          barrierDismissible: false,
          InfoCustomDialog(
            title: GeneralConstants.titleAdvertenciaDialogInfo,
            body: HomeConstants.labelAdvertenciaTiendaDuplicada,
            titleButton: GeneralConstants.labelButtonDialogInfo,
          ),
        );
      }
    } else {
      Get.dialog(
        barrierDismissible: false,
        InfoCustomDialog(
          title: GeneralConstants.titleAdvertenciaDialogInfo,
          body: HomeConstants.labelAdvertenciaCrearTienda,
          titleButton: GeneralConstants.labelButtonDialogInfo,
        ),
      );
    }
  }

  Future<bool> comprobarRepeticion(String title) async {
    List<Tienda> allTiendasDisponibles = await SqlInicialice.getTodasLasTiendas();
    for (Tienda tienda in allTiendasDisponibles) {
      if (tienda.tiendaNombre == title) {
        return true;
      }
    }
    return false;
  }

  void updateFavorite(bool switchValue) {
    isFavorite = switchValue;
    update();
  }

  void updateIsTemporal(bool switchValue) {
    isTemporal = switchValue;
    update();
  }
}
