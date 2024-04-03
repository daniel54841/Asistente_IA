import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reproductor_ia/controllers/list_controller.dart';
import 'package:reproductor_ia/widgets/TextFormFields/custom_text_form_field.dart';
import 'package:reproductor_ia/widgets/item_list_views/item_new_producto_busqueda.dart';

import '../../utils/constants/list_constants.dart';

class NewCompra extends StatelessWidget {
  NewCompra({Key? key}) : super(key: key);
  final TextEditingController _ctrl = TextEditingController();
  final ListController _listCtrl = Get.find<ListController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextFormFields(
          ctrl: _ctrl,
          titleLabel: ListConstants.nuevoProducto,
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
      ),
      body: GetBuilder(
        builder: (ListController ctrl) {
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
