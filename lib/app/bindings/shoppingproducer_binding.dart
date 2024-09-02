import 'package:app_pacharuna/app/controllers/shoppingproducer_controller.dart';
import 'package:get/get.dart';

class ShoppingproducerBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<ShoppingproducerController>(() => ShoppingproducerController());
  }
}