import 'package:app_pacharuna/app/bindings/createproduct_binding.dart';
import 'package:app_pacharuna/app/bindings/detailproduct_binding.dart';
import 'package:app_pacharuna/app/bindings/homecustomer_binding.dart';
import 'package:app_pacharuna/app/bindings/homeproducer_binding.dart';
import 'package:app_pacharuna/app/bindings/login_binding.dart';
import 'package:app_pacharuna/app/bindings/registercustomer_Binding.dart';
import 'package:app_pacharuna/app/bindings/registerproducer_binding.dart';
import 'package:app_pacharuna/app/bindings/shoppingcustomer_binding.dart';
import 'package:app_pacharuna/app/bindings/shoppingdetailcustomer_binding.dart';
import 'package:app_pacharuna/app/bindings/shoppingdetailproducer_binding.dart';
import 'package:app_pacharuna/app/bindings/shoppingproducer_binding.dart';
import 'package:app_pacharuna/app/bindings/updateproduct_binding.dart';
import 'package:app_pacharuna/app/middlewares/global_middleware.dart';
import 'package:app_pacharuna/app/ui/pages/createproduct/createproduct_page.dart';
import 'package:app_pacharuna/app/ui/pages/detailproduct/detailproduct_page.dart';
import 'package:app_pacharuna/app/ui/pages/homecustomer/homecustomer_page.dart';
import 'package:app_pacharuna/app/ui/pages/homeproducer/homeproducer_page.dart';
import 'package:app_pacharuna/app/ui/pages/login/login_page.dart';
import 'package:app_pacharuna/app/ui/pages/registercustomer/registercustomer_page.dart';
import 'package:app_pacharuna/app/ui/pages/registerproducer/registerproducer_page.dart';
import 'package:app_pacharuna/app/ui/pages/shoppingcustomer/shoppingcustomer_page.dart';
import 'package:app_pacharuna/app/ui/pages/shoppingdetailcustomer/shoppingdetailcustomer_page.dart';
import 'package:app_pacharuna/app/ui/pages/shoppingdetailproducer/shoppingdetailproducer_page.dart';
import 'package:app_pacharuna/app/ui/pages/shoppingproducer/shoppingproducer_page.dart';
import 'package:app_pacharuna/app/ui/pages/updateproduct/updateproduct_page.dart';
import 'package:get/get.dart';
part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginPage(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
      middlewares: [
        GlobalMiddleware(),
      ],
    ),
    GetPage(
      name: Routes.REGISTER_CUSTOMER,
      page: () => const RegisterCustomerPage(),
      transition: Transition.fadeIn,
      binding: RegisterCustomerBinding(),
    ),
    GetPage(
      name: Routes.REGISTER_PRODUCER,
      page: () => const RegisterProducerPage(),
      transition: Transition.fadeIn,
      binding: RegisterProducerBinding(),
    ),
    GetPage(
      name: Routes.HOME_CUSTOMER,
      page: () => const HomecustomerPage(),
      transition: Transition.fadeIn,
      binding: HomecustomerBinding(),
    ),
    GetPage(
      name: Routes.HOME_PRODUCER,
      page: () => const HomeProducerPage(),
      transition: Transition.fadeIn,
      binding: HomeProducerBinding(),
    ),
    GetPage(
      name: Routes.DETAIL_PRODUCT,
      page: () => const DetailProductPage(),
      transition: Transition.fadeIn,
      binding: DetailProductBinding(),
    ),
    GetPage(
      name: Routes.CREATE_PRODUCT,
      page: () => const CreateProductPage(),
      transition: Transition.fadeIn,
      binding: CreateProductBinding(),
    ),
    GetPage(
      name: Routes.UPDATE_PRODUCT,
      page: () => const UpdateProductPage(),
      transition: Transition.fadeIn,
      binding: UpdateProductBinding(),
    ),
    GetPage(
      name: Routes.SHOPPING_CUSTOMER,
      page: () => const ShoppingCustomerPage(),
      transition: Transition.fadeIn,
      binding: ShoppingCustomerBinding(),
    ),
    GetPage(
      name: Routes.SHOPPING_PRODUCER,
      page: () => const ShoppingproducerPage(),
      transition: Transition.fadeIn,
      binding: ShoppingproducerBinding(),
    ),
    GetPage(
      name: Routes.SHOPPING_DETAIL_CUSTOMER,
      page: () => const ShoppingDetailCustomerPage(),
      transition: Transition.fadeIn,
      binding: ShoppingDetailCustomerBinding(),
    ),
    GetPage(
      name: Routes.SHOPPING_DETAIL_PRODUCER,
      page: () => const ShoppingdetailproducerPage(),
      transition: Transition.fadeIn,
      binding: ShoppingdetailproducerBinding(),
    ),
  ];
}
