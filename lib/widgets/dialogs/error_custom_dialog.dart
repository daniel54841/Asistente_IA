import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../buttons/custom_button_white.dart';

class ErrorCustomDialog extends StatelessWidget {
  final String message;
  const ErrorCustomDialog({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text("Error"),
      ),
      content: Center(
        child: Text(message),
      ),
      actions: [
        CustomButtonWhite(
          title: "Cerrar",
          onTap: () {
            Get.back();
          },
        ),
      ],
    );
  }
}
