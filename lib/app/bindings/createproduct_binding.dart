import 'package:app_pacharuna/app/controllers/createproduct_controller.dart';
import 'package:get/get.dart';

class CreateProductBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<CreateProductController>(() => CreateProductController());
  }
}