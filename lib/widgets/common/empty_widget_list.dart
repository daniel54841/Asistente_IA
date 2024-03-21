import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:reproductor_ia/controllers/base_controller.dart';
import 'package:reproductor_ia/utils/constants/home_constants.dart';

import '../../utils/responsive.dart';

class EmptyWidgetList extends StatelessWidget {
  final BaseController ctrl;

  final bool? showMessage;
  final double? sizeAnimation;

  EmptyWidgetList({
    super.key,
    required this.ctrl,
    this.showMessage,
    this.sizeAnimation,
  });

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive.of(context);

    return Padding(
      padding: EdgeInsets.only(top: responsive.hp(10)),
      child: Center(
        child: Column(
          children: [
            Lottie.asset(
              ctrl.getLoadEmptyList(),
              repeat: true,
              animate: true,
              width: sizeAnimation == null ? responsive.wp(35) : responsive.wp(sizeAnimation!), //150
              height: sizeAnimation == null ? responsive.hp(22) : responsive.wp(sizeAnimation!), //130
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: responsive.dp(5),
                right: responsive.dp(10),
                left: responsive.dp(10),
              ),
              child: Visibility(
                visible: showMessage != null ? showMessage! : true,
                child: Text(
                  HomeConstants.labelEmptyList,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: responsive.dp(1.5),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
