import 'package:app_pacharuna/app/controllers/register_controller.dart';
import 'package:get/get.dart';

class RegisterBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<RegisterController>(() => RegisterController());
  }
}