import 'package:flutter/material.dart';

class ItemNewProductoBusqueda extends StatelessWidget {
  final String productoBuscado;
  ItemNewProductoBusqueda({Key? key, required this.productoBuscado}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.add),
        ),
        Text(
          productoBuscado,
        ),
      ],
    );
  }
}
