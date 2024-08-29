import 'package:app_pacharuna/app/controllers/registercustomer_controller.dart';
import 'package:get/get.dart';

class RegisterCustomerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterCustomerController>(() => RegisterCustomerController());
  }
}
