import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/responsive.dart';

class ErrorCustomDialog extends StatelessWidget {
  final String message;
  const ErrorCustomDialog({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive.of(context);
    return Material(
      child: Center(
        child: Column(
          children: [
            Title(
              color: Colors.black,
              child: Text("Error"),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  width: responsive.wp(50), //200
                  height: responsive.dp(4), //55
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      message,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: responsive.dp(8),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ); /*AlertDialog(
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
    );*/
  }
}
