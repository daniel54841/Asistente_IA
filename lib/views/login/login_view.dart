import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:swipable_stack/swipable_stack.dart';

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
    Responsive _responsive = Responsive.of(context);
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
                          Color(0xF3E00B67),
                        ],
                        stops: [
                          0,
                        ],
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
                        ///TODO: meter responsive cuando se ejecute en la app
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                            0,
                            200,
                            0,
                            0,
                          ),
                          child: Container(
                            width: double.infinity,
                            height: 500,
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  25, 25, 25, 25),
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: const Color(0x6EE00B67),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                    25,
                                    25,
                                    25,
                                    25,
                                  ),
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: const Color(0x6EE00B67),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              5, 0, 5, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Lottie.network(
                                            'https://assets8.lottiefiles.com/packages/lf20_li0pgakp.json',
                                            width: 150,
                                            height: 130,
                                            fit: BoxFit.cover,
                                            repeat: false,
                                            animate: true,
                                          ),
                                          CustomTextFormFields(
                                            ctrl: emailAddressController!,
                                            icon: Icons.email_outlined,
                                            titleLabel: "E-mail",
                                          ),
                                          CustomTextFormFields(
                                            ctrl: passwordController!,
                                            icon: Icons.lock_outline,
                                            titleLabel: "Password",
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 15, 0, 0),
                                            child: Container(
                                              width: 200,
                                              height: 55,
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
                                              child: InkWell(
                                                onTap: () {
                                                  debugPrint(
                                                      "Navegacion hacia Home");
                                                },
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: const [
                                                        Text(
                                                          "LOGIN",
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SwipableStack(
                          builder: (context, swipeProperty) {
                            return [
                              () => Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: const Color(0x83E00B67),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                            Text('music',
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
                                  ),
                            ][swipeProperty.index]();
                          },
                          itemCount: 3,
                          controller: swipeableCardSectionController,
                          allowVerticalSwipe: false,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
