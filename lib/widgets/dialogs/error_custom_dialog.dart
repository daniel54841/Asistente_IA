import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/general_constants.dart';
import '../../utils/constants/my_colors.dart';
import '../../utils/responsive.dart';
import 'basic_dialog_custom.dart';

class ErrorCustomDialog extends StatelessWidget {
  final String body;

  ErrorCustomDialog({
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive.of(context);
    return BasicDialogCustom(
      widget: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Row(
              children: [
                Icon(
                  Icons.error_outline,
                  color: MyColors.blackRed,
                ),
                const Text(
                  GeneralConstants.titleDialogError,
                ),
              ],
            ),
          ),
          SizedBox(
            height: responsive.hp(
              1.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Text(
              body,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: responsive.hp(5),
            ),
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: MyColors.lightGrey),
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(responsive.dp(1.5)),
                  ),
                ),
                child: const Text(
                  GeneralConstants.labelConfirmarDialogo,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
