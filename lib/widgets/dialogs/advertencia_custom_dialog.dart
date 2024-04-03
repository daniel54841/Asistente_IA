import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reproductor_ia/widgets/dialogs/basic_dialog_custom.dart';

import '../../utils/constants/my_colors.dart';
import '../../utils/responsive.dart';

class AdvertenciaCustomDialog extends StatelessWidget {
  final String title;
  final String body;
  final Function() onTap;
  AdvertenciaCustomDialog({
    Key? key,
    required this.title,
    required this.body,
    required this.onTap,
  }) : super(key: key);

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
                const Icon(
                  Icons.warning,
                  color: Colors.amberAccent,
                ),
                Text(
                  title,
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
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: responsive.hp(5),
                ),
                child: GestureDetector(
                  onTap: onTap,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: MyColors.lightGrey),
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(responsive.dp(1.5)),
                      ),
                    ),
                    child: Text(
                      "Confirmar",
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: responsive.hp(
                  1.5,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: responsive.hp(5),
                  left: responsive.dp(1.5),
                  right: responsive.dp(1.5),
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
                    child: Text(
                      "Cancelar",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
