import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/my_colors.dart';
import '../../utils/responsive.dart';

class InfoCustomDialog extends StatelessWidget {
  final String title;
  final String body;
  final String titleButton;

  InfoCustomDialog({
    Key? key,
    required this.title,
    required this.body,
    required this.titleButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive.of(context);
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(responsive.dp(5)),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(title),
            ),
            SizedBox(
              height: responsive.hp(1.5),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
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
                  child: Text(
                    titleButton,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
