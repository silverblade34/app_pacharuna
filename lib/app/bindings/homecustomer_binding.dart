import 'package:app_pacharuna/app/controllers/homecustomer_controller.dart';
import 'package:get/get.dart';

class HomecustomerBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<HomecustomerController>(() => HomecustomerController(
));
  }
}