import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reproductor_ia/controllers/home_controller.dart';

import '../../utils/constants/home_constants.dart';
import '../../utils/responsive.dart';
import '../../widgets/common/empty_widget_list.dart';

class ListNewItem extends StatefulWidget {
  ListNewItem({Key? key}) : super(key: key);
  @override
  State<ListNewItem> createState() => _ListNewItemState();
}

class _ListNewItemState extends State<ListNewItem> {
  HomeController _homeCtrl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).splashColor,
        title: Center(
          child: Text(
            HomeConstants.labelNuevaLista,
            style: TextStyle(
              fontSize: responsive.dp(2.5),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          EmptyWidgetList(
            ctrl: _homeCtrl,
          )
        ],
      ),
    );
  }
}
