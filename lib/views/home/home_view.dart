import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reproductor_ia/controllers/home_controller.dart';
import 'package:reproductor_ia/utils/constants/home_constants.dart';
import 'package:reproductor_ia/widgets/common/empty_widget_list.dart';

import '../../utils/responsive.dart';
import '../../widgets/item_list_views/buy_item.dart';

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
            fontSize: responsive.dp(5),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Expanded(
          child: _ctrl.dataBuy.isNotEmpty
              ? GetBuilder(
                  builder: (HomeController controller) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return BuyItem();
                      },
                      itemCount: controller.dataBuy.length,
                    );
                  },
                )
              : EmptyWidgetList(ctrl: _ctrl)

          /*GetBuilder(
          builder: (HomeController ctrl) {
            return */ /*ctrl.dataBuy.isNotEmpty
                ? ListView.builder(
                    itemBuilder: (context, index) {
                      return BuyItem();
                    },
                    itemCount: ctrl.dataBuy.length,
                  )
                :*/ /*
                Container();
          },
        ),*/
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
