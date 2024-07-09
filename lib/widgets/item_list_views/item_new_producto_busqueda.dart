import 'package:flutter/material.dart';

import '../../controllers/list_controller.dart';

class ItemNewProductoBusqueda extends StatelessWidget {
  final String productoBuscado;
  final ListController listController;
  ItemNewProductoBusqueda({Key? key, required this.productoBuscado, required this.listController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            listController.addCompraToTienda();
          },
          icon: Icon(
            Icons.add,
          ),
        ),
        AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.bounceIn,
          child: Text(
            productoBuscado,
          ),
        ),
      ],
    );
  }
}
