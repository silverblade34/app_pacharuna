import 'package:app_pacharuna/app/bindings/detailproduct_binding.dart';
import 'package:app_pacharuna/app/bindings/homecustomer_binding.dart';
import 'package:app_pacharuna/app/bindings/login_binding.dart';
import 'package:app_pacharuna/app/bindings/register_binding.dart';
import 'package:app_pacharuna/app/middlewares/global_middleware.dart';
import 'package:app_pacharuna/app/ui/pages/detailproduct/detailproduct_page.dart';
import 'package:app_pacharuna/app/ui/pages/homecustomer/homecustomer_page.dart';
import 'package:app_pacharuna/app/ui/pages/login/login_page.dart';
import 'package:app_pacharuna/app/ui/pages/register/register_page.dart';
import 'package:get/get.dart';
part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginPage(),
      binding: LoginBinding(),
      middlewares: [
        GlobalMiddleware(),
      ],
    ),
     GetPage(
      name: Routes.REGISTER,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.HOME_CUSTOMER,
      page: () => const HomecustomerPage(),
      binding: HomecustomerBinding(),
    ),
    GetPage(
      name: Routes.DETAIL_PRODUCT,
      page: () => const DetailProductPage(),
      binding: DetailProductBinding(),
    ),
  ];
}
