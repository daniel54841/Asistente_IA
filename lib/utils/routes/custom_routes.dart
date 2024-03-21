import 'package:get/get.dart';
import 'package:reproductor_ia/views/list/list_new_item.dart';

import '../../views/home/home_view.dart';
import '../../views/list/list_compra_view.dart';
import '../../views/list/list_detail_view.dart';
import '../../views/login/login_view.dart';

class CustomRoutes {
  static List<GetPage<dynamic>> getListRoutes() {
    return [
      GetPage(
        name: "/login",
        page: () => const LoginView(),
      ),
      GetPage(
        name: "/home",
        page: () => HomeView(),
      ),
      GetPage(
        name: "/list",
        page: () => ListCompraView(),
      ),
      GetPage(
        name: "/detail_list",
        page: () => const ListDetailView(),
      ),
      GetPage(
        name: "/new_item_list",
        page: () => ListNewItem(),
      )
    ];
  }
}
