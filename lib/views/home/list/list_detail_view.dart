import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reproductor_ia/controllers/list_buy_item_controller.dart';
import 'package:reproductor_ia/widgets/common/empty_widget_list.dart';

import '../../../controllers/models/Buy.dart';

class ListDetailView extends StatefulWidget {
  const ListDetailView({super.key});

  @override
  State<ListDetailView> createState() => _ListDetailViewState();
}

class _ListDetailViewState extends State<ListDetailView> {
  List<Buy> buy = [];
  int indice = 0;
  @override
  void initState() {
    super.initState();
    setState(() {
      buy = Get.arguments["itemData"] as List<Buy>;
      indice = Get.arguments["indice"] as int;
    });
    debugPrint("Informacion pasada: $buy");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(buy[indice].nombre!),
        backgroundColor: Theme.of(context).splashColor,
      ),
      body: GetBuilder(
        builder: (ListBuyItemController ctrl) {
          return EmptyWidgetList(ctrl: ctrl);
        },
      ),
    );
  }
}
