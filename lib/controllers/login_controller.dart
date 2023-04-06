import 'package:get/get.dart';

class LoginController extends GetxController {
  bool isRepeat = true;
  void updateLogo(bool value) {
    isRepeat = value;
    update();
  }
}
