import 'package:app_pacharuna/app/controllers/updateproduct_controller.dart';
import 'package:get/get.dart';

class UpdateProductBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<UpdateProductController>(() => UpdateProductController());
  }
}