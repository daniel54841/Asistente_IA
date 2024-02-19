import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:reproductor_ia/controllers/home_controller.dart';
import 'package:reproductor_ia/utils/constants/home_constants.dart';

import '../../utils/responsive.dart';

class EmptyWidgetList extends StatelessWidget {
  final HomeController ctrl;
  EmptyWidgetList({super.key, required this.ctrl});

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
              width: responsive.wp(35), //150
              height: responsive.hp(22), //130
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: responsive.dp(5),
                right: responsive.dp(10),
                left: responsive.dp(10),
              ),
              child: Text(
                HomeConstants.labelEmptyList,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: responsive.dp(1.5),
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
