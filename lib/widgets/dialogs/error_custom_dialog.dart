import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/general_constants.dart';

class ErrorCustomDialog {
  static Future<dynamic> errorDialog(String texto) async {
    if (Get.isDialogOpen!) {
      Get.back();
    }
    return Get.defaultDialog(
      title: GeneralConstants.titleDialogError,
      content: Text(
        texto,
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: const Text(
            GeneralConstants.labelCerrarDialogo,
          ),
        ),
      ],
    );
  }
}
