import 'package:app_pacharuna/app/controllers/shoppingcustomer_controller.dart';
import 'package:get/get.dart';

class ShoppingCustomerBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<ShoppingCustomerController>(() => ShoppingCustomerController());
  }
}