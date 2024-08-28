import 'package:app_pacharuna/app/controllers/detailproduct_controller.dart';
import 'package:get/get.dart';

class DetailProductBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<DetailProductController>(() => DetailProductController());
  }
}