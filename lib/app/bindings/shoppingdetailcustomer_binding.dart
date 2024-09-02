import 'package:app_pacharuna/app/controllers/shoppingdetailcustomer_controller.dart';
import 'package:get/get.dart';

class ShoppingDetailCustomerBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<ShoppingDetailCustomerController>(() => ShoppingDetailCustomerController());
  }
}