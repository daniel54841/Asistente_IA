import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:get/get.dart';

import '../../../controllers/models/compra.dart';
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

    /*buy = Get.arguments["itemData"] as List<Compra>;
      indice = Get.arguments["indice"] as int;*/
    tienda = Get.arguments["tienda"] as Tienda;
  }

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          /*buy.isNotEmpty ? buy[indice].nombre! :*/ tienda.tiendaNombre!,
        ),
        backgroundColor: Theme.of(context).splashColor,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: responsive.wp(1.5),
                left: responsive.wp(1.5),
              ),
              child: FAProgressBar(
                backgroundColor: Colors.blueGrey,
                size: responsive.dp(2.5),
                displayTextStyle: TextStyle(color: Colors.black),
                changeColorValue: 2,
                currentValue: 1, //valor que progresa
                changeProgressColor: Colors.lightGreenAccent,
                maxValue: 15, //maximo valor que puede progresar
              ),
            ),
          ],
        ),
      ),

      /**
        return EmptyWidgetList(
          ctrl: ctrl,
          );

          GetBuilder(
        builder: (ListBuyItemController ctrl) {
          return Container(
            child: Text("Contador total de items que tiene en forma redondeada que se va a ir actualizando segun se quiten los elementos"),
          );
        },
      ),*/
    );
  }
}
