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
            ),
            Text(
              HomeConstants.labelEmptyList,
              style: TextStyle(
                color: Colors.white,
                fontSize: responsive.dp(2.5),
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
