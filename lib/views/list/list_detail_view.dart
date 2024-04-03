import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:get/get.dart';

import '../../../controllers/models/compra.dart';
import '../../controllers/list_buy_item_controller.dart';
import '../../controllers/models/tienda.dart';
import '../../utils/responsive.dart';

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
    tienda = Get.arguments["tienda"] as Tienda;
    if (tienda.tiendaNombre != null) {
      ListController _ctrl = Get.find<ListController>();
      _ctrl.searchCompra(tienda.tiendaNombre);
    }
  }

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          tienda.tiendaNombre!,
        ),
        backgroundColor: Theme.of(context).splashColor,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: responsive.wp(1.5), left: responsive.wp(1.5), top: responsive.hp(2.5)),
              child: FAProgressBar(
                backgroundColor: Colors.blueGrey,
                size: responsive.dp(2.5),
                displayTextStyle: const TextStyle(color: Colors.black),
                changeColorValue: 2,
                currentValue: 1, //valor que progresa
                changeProgressColor: Colors.lightGreenAccent,
                maxValue: 15, //maximo valor que puede progresar
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed("/new_compra");
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
