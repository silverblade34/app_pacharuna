import 'package:app_pacharuna/app/controllers/homeproducer_controller.dart';
import 'package:get/get.dart';

class HomeProducerBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<HomeProducerController>(() => HomeProducerController());
  }
}