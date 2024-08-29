import 'package:app_pacharuna/app/controllers/registerproducer_controller.dart';
import 'package:get/get.dart';

class RegisterProducerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterProducerController>(() => RegisterProducerController());
  }
}
