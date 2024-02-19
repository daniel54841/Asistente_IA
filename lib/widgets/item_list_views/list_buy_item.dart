import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:get/get.dart';
import 'package:reproductor_ia/utils/constants/list_buy_constants.dart';

import '../../controllers/models/Buy.dart';
import '../../utils/responsive.dart';

class ListBuyItem extends StatelessWidget {
  final List<Buy?> item;
  final int index;
  const ListBuyItem({super.key, required this.item, required this.index});

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Get.toNamed(
            "/detail_list",
            arguments: {
              "itemData": item,
              "indice": index,
            },
          );
        },
        child: Card(
          color: Colors.grey,
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      item[index]!.nombre!,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FAProgressBar(
                        backgroundColor: Colors.blueGrey,
                        size: responsive.dp(5),
                        displayText: "/15",
                        displayTextStyle: TextStyle(color: Colors.black),
                        changeColorValue: 2,
                        currentValue: 1, //valor que progresa
                        changeProgressColor: Colors.lightGreenAccent,
                        maxValue: 15, //maximo valor que puede progresar
                      ),
                    ),
                  ),
                  PopupMenuButton(
                    itemBuilder: (context) {
                      return [
                        const PopupMenuItem(
                          value: 1,
                          child: Text(BuyConstants.renameItem),
                        ),
                        const PopupMenuItem(
                          value: 2,
                          child: Text(BuyConstants.deleteItem),
                        )
                      ];
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
