import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';

import '../../utils/responsive.dart';

class BasicDialogCustom extends StatelessWidget {
  final Widget widget;
  const BasicDialogCustom({Key? key, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive.of(context);
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: Device.get().isTablet ? responsive.dp(30) : responsive.dp(10),
        padding: EdgeInsets.all(
          responsive.dp(5),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: widget,
      ),
    );
  }
}
