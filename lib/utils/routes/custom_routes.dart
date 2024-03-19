import 'package:get/get.dart';

import '../../views/home/list/list_detail_view.dart';
/*import '../views/home/list_view.dart';*/
import '../../views/home/list_view.dart';
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
        page: () => List_View(),
      ),
      GetPage(
        name: "/detail_list",
        page: () => const ListDetailView(),
      ),
    ];
  }
}
