import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorCustomDialog {
  static Future<Widget> errorDialog(String texto) async {
    if (Get.isDialogOpen!) {
      Get.back();
    }
    return await Get.defaultDialog(
      title: "Error",
      content: Text(
        texto,
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: Text("Cerrar"),
        ),
      ],
    );
  }
}
