import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reproductor_ia/controllers/list_buy_item_controller.dart';
import 'package:reproductor_ia/widgets/TextFormFields/custom_text_form_field.dart';
import 'package:reproductor_ia/widgets/item_list_views/item_new_producto_busqueda.dart';

class NewCompra extends StatelessWidget {
  NewCompra({Key? key}) : super(key: key);
  final TextEditingController _ctrl = TextEditingController();
  ListBuyItemController _listCtrl = Get.find<ListBuyItemController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextFormFields(
          ctrl: _ctrl,
          titleLabel: "Agregar nuevo producto",
          getCtrl: _listCtrl,
        ),
        actions: [
          IconButton(
            onPressed: () {
              _listCtrl.cleanOnlyUIItems();
            },
            icon: const Icon(
              Icons.cleaning_services_rounded,
            ),
          )
        ],
        /*leading: IconButton(
          icon: const Icon(Icons.check),
          onPressed: () {},
        ),*/
      ),
      body: GetBuilder(
        builder: (ListBuyItemController ctrl) {
          return ctrl.datos.isEmpty
              ? Container()
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return ItemNewProductoBusqueda(
                      productoBuscado: ctrl.datos[index].producto!,
                    );
                  },
                  itemCount: ctrl.datos.length,
                );
        },
      ),
    );
  }
}
