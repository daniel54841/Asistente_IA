import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reproductor_ia/controllers/home_controller.dart';
import 'package:reproductor_ia/utils/constants/home_constants.dart';
import 'package:reproductor_ia/widgets/common/empty_widget_list.dart';

import '../../utils/responsive.dart';
import '../../widgets/item_list_views/list_buy_item.dart';

class HomeView extends StatelessWidget {
  final HomeController _ctrl = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive.of(context);
    return Scaffold(
      drawer: const Drawer(
        child: Column(
          children: [
            Text("Home"),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).splashColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).splashColor,
        title: Text(
          HomeConstants.titleHome,
          style: TextStyle(
            fontSize: responsive.dp(2.5),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: GetBuilder(
        builder: (HomeController ctrl) {
          if (ctrl.dataBuy.isNotEmpty) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListBuyItem(
                  item: ctrl.getItems(index),
                  index: index,
                );
              },
              itemCount: ctrl.dataBuy.values.length,
            );
          } else {
            return EmptyWidgetList(
              ctrl: _ctrl,
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
