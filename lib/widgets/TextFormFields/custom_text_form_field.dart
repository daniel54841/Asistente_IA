import 'package:flutter/material.dart';
import 'package:reproductor_ia/utils/constants/my_colors.dart';

import '../../utils/responsive.dart';

class CustomTextFormFields extends StatelessWidget {
  final TextEditingController ctrl;
  final String titleLabel;
  const CustomTextFormFields({
    Key? key,
    required this.ctrl,
    required this.titleLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive.of(context);
    return Padding(
      padding: EdgeInsetsDirectional.only(start: responsive.wp(5), end: responsive.wp(5)),
      child: Card(
        elevation: 0.0,
        color: MyColors.lightGrey,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: MyColors.black,
            width: responsive.wp(0.2),
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: responsive.wp(3.5)),
          child: TextField(
            //keyboardType: widget.inputType,
            controller: ctrl,
            decoration: InputDecoration(
              hintStyle: TextStyle(
                color: MyColors.black,
                fontWeight: FontWeight.bold,
              ),
              border: InputBorder.none,
              hintText: titleLabel,
            ),
          ),
        ),
      ),
    );
  }
}
