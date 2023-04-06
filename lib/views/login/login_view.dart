import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:swipable_stack/swipable_stack.dart';

import '../../controllers/login_controller.dart';
import '../../utils/responsive.dart';
import '../../widgets/TextFormFields/custom_text_form_fields.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with TickerProviderStateMixin {
  TextEditingController? emailAddressController;
  TextEditingController? passwordController;
  late SwipableStackController swipeableCardSectionController;
  final _unfocusNode = FocusNode();
  final LoginController _loginCtrl = Get.find<LoginController>();
  @override
  void initState() {
    super.initState();
    swipeableCardSectionController = SwipableStackController();
    emailAddressController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive.of(context);
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xB2B60F22),
                          Color(0xF3A028B2),
                        ],
                        stops: [0, 1],
                        begin: AlignmentDirectional(
                          1,
                          -0.34,
                        ),
                        end: AlignmentDirectional(
                          -1,
                          0.34,
                        ),
                      ),
                    ),
                    child: Stack(
                      children: [
                        //Containers del Login( TextFormField e imagen de login)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            0,
                            responsive.dp(15), //200
                            0,
                            0,
                          ),
                          child: Container(
                            width: double.infinity,
                            height: responsive.dp(60), //500
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                            ),
                            //Caja de atras
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  responsive.dp(2),
                                  responsive.dp(2),
                                  responsive.dp(2),
                                  responsive.dp(2)), //25 en todas
                              child: Container(
                                width: responsive.dp(30), //100
                                height: responsive.dp(30),
                                decoration: BoxDecoration(
                                  color: const Color(0xA5B55B67),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      responsive.hp(2.1),
                                      0,
                                      responsive.hp(2.1),
                                      0), //5
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        GetBuilder(
                                          builder: (LoginController ctrl) {
                                            return Lottie.network(
                                              'https://assets8.lottiefiles.com/packages/lf20_li0pgakp.json',
                                              width: responsive.wp(35), //150
                                              height: responsive.hp(22), //130
                                              fit: BoxFit.cover,
                                              repeat: ctrl.isRepeat,
                                              animate: true,
                                            );
                                          },
                                        ),
                                        //TextFormField del correo
                                        CustomTextFormFields(
                                          ctrl: emailAddressController!,
                                          icon: Icons.email_outlined,
                                          titleLabel: "E-mail",
                                        ),
                                        //TextFormField de la contraseña
                                        CustomTextFormFields(
                                          ctrl: passwordController!,
                                          icon: Icons.lock_outline,
                                          titleLabel: "Password",
                                        ),
                                        //Boton de login
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0, 15, 0, 0),
                                          child: GestureDetector(
                                            onTap: () {
                                              debugPrint(
                                                  "Navegacion hacia Home");
                                            },
                                            child: Container(
                                              width: responsive.wp(50), //200
                                              height: responsive.hp(10), //55
                                              decoration: BoxDecoration(
                                                gradient: const LinearGradient(
                                                  colors: [
                                                    Color(0xAE4B39EF),
                                                    Colors.lightBlueAccent,
                                                  ],
                                                  stops: [
                                                    0,
                                                    1,
                                                  ],
                                                  begin: AlignmentDirectional(
                                                      0, -1),
                                                  end: AlignmentDirectional(
                                                      0, -1),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  10,
                                                ),
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  "LOGIN",
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SwipableStack(
                    builder: (context, swipeProperty) {
                      return [
                        () => Container(
                              width: responsive.dp(100),
                              height: responsive.dp(100),
                              decoration: BoxDecoration(
                                color: const Color(0x83E00B67),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text('+more',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 52)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                        () => Container(
                              width: responsive.dp(75),
                              height: responsive.dp(75),
                              decoration: BoxDecoration(
                                color: const Color(0xF3E0C30B),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        'music',
                                        style: TextStyle(
                                          fontSize: 35,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                        /* () => Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: const Color(0xF3E0C30B),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Text('on your phone',
                                                style: TextStyle(
                                                  fontSize: 35,
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                              () => Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Text(
                                              'in your phone',
                                              style: TextStyle(
                                                fontSize: 40,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),*/
                      ][swipeProperty.index]();
                    },
                    itemCount: 2,
                    controller: swipeableCardSectionController,
                    allowVerticalSwipe: false,
                    onSwipeCompleted: (index, direction) {
                      if (index == 1) {
                        //cambiar a 2
                        _loginCtrl.updateLogo(false);
                      }
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
