import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reproductor_ia/controllers/home_controller.dart';
import 'package:reproductor_ia/utils/constants/home_constants.dart';

import '../../utils/responsive.dart';
import '../../widgets/common/empty_widget_list.dart';
import '../../widgets/item_list_views/list_buy_item.dart';

class List_View extends StatelessWidget {
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
        builder: (HomeController controller) {
          if (controller.dataBuy.isEmpty) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListBuyItem(
                  item: controller.getItems(index),
                  index: index,
                );
              },
              itemCount: controller.dataBuy.values.length,
            );
          } else {
            return EmptyWidgetList(
              ctrl: controller,
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
