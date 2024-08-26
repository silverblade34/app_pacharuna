import 'package:app_pacharuna/app/bindings/homecustomer_binding.dart';
import 'package:app_pacharuna/app/bindings/login_binding.dart';
import 'package:app_pacharuna/app/ui/pages/homecustomer/homecustomer_page.dart';
import 'package:app_pacharuna/app/ui/pages/login/login_page.dart';
import 'package:get/get.dart';
part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginPage(),
      binding: LoginBinding()
    ),
        GetPage(
      name: Routes.HOME_CUSTOMER,
      page: () => const HomecustomerPage(),
      binding: HomecustomerBinding()
    ),
  ];
}
