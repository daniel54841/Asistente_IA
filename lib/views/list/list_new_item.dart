import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reproductor_ia/controllers/home_controller.dart';
import 'package:reproductor_ia/widgets/TextFormFields/custom_text_field.dart';

import '../../utils/constants/home_constants.dart';
import '../../utils/responsive.dart';
import '../../widgets/common/empty_widget_list.dart';

class ListNewItem extends StatefulWidget {
  ListNewItem({Key? key}) : super(key: key);

  @override
  State<ListNewItem> createState() => _ListNewItemState();
}

class _ListNewItemState extends State<ListNewItem> {
  final HomeController _homeCtrl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).splashColor,
        title: Center(
          child: Text(
            HomeConstants.labelNuevaLista,
            style: TextStyle(
              fontSize: responsive.dp(2.5),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          EmptyWidgetList(
            ctrl: _homeCtrl,
            showMessage: false,
            sizeAnimation: 20,
          ),
          GetBuilder(builder: (HomeController ctrl) {
            return CustomTextFormFields(
              ctrl: ctrl.etCtrl,
              titleLabel: HomeConstants.labelNuevaLista,
            );
          }),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetBuilder(
                builder: (HomeController ctrl) {
                  return Switch(
                    value: ctrl.isFavorite,
                    onChanged: (value) {
                      ctrl.updateFavorite(value);
                    },
                  );
                },
              ),
              SizedBox(
                width: responsive.wp(2.5),
              ),
              const Text(HomeConstants.labelAddFavorite),
            ],
          ),
          Visibility(
            visible: false,
            child: Flexible(
              flex: 2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: responsive.hp(1.5)),
                    child: GetBuilder(
                      builder: (HomeController ctrl) {
                        return Switch(
                          value: ctrl.isTemporal,
                          onChanged: (value) {
                            ctrl.updateIsTemporal(value);
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: responsive.wp(2.5),
                  ),
                  const Text(HomeConstants.labelAddFavorite),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
            child: GestureDetector(
              onTap: () {
                _homeCtrl.createTienda(
                  _homeCtrl.isFavorite,
                  responsive,
                );
              },
              child: Container(
                width: responsive.wp(50), //200
                height: responsive.dp(4), //55
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
                    begin: AlignmentDirectional(0, -1),
                    end: AlignmentDirectional(0, -1),
                  ),
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                child: Center(
                  child: Text(
                    "CREAR",
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
