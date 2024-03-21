import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reproductor_ia/controllers/list_buy_item_controller.dart';
import 'package:reproductor_ia/widgets/common/empty_widget_list.dart';

import '../../../controllers/models/compra.dart';
import '../../controllers/models/tienda.dart';

class ListDetailView extends StatefulWidget {
  const ListDetailView({super.key});

  @override
  State<ListDetailView> createState() => _ListDetailViewState();
}

class _ListDetailViewState extends State<ListDetailView> {
  List<Compra> buy = [];
  late Tienda tienda;
  int indice = 0;
  @override
  void initState() {
    super.initState();

    /*buy = Get.arguments["itemData"] as List<Compra>;
      indice = Get.arguments["indice"] as int;*/
    tienda = Get.arguments["tienda"] as Tienda;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          /*buy.isNotEmpty ? buy[indice].nombre! :*/ tienda.tiendaNombre!,
        ),
        backgroundColor: Theme.of(context).splashColor,
      ),
      body: GetBuilder(
        builder: (ListBuyItemController ctrl) {
          return EmptyWidgetList(
            ctrl: ctrl,
          );
        },
      ),
    );
  }
}
