import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with TickerProviderStateMixin{


  late LoginViewModel _model;

  final _unfocusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    _model = LoginViewModel();
    _model.emailAddressController ??= TextEditingController();
    _model.passwordController ??= TextEditingController();
    _model.emailAddressCreateController ??= TextEditingController();
    _model.passwordCreateController ??=TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Stack(
          alignment: const AlignmentDirectional(0,1),
          children:  [
            Align(
              alignment: AlignmentDirectional(1,-1.4),
              child: Container(),
            )
          ],
        ),
      ),
    );
  }
}
