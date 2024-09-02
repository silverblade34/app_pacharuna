import 'package:app_pacharuna/app/controllers/shoppingdetailproducer_controller.dart';
import 'package:get/get.dart';

class ShoppingdetailproducerBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<ShoppingdetailproducerController>(() => ShoppingdetailproducerController());
  }
}