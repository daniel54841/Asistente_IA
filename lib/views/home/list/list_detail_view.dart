import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        ),
        body: Container());
  }
}
