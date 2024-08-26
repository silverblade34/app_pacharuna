import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  validateUser() async {
    final box = GetStorage();
    if (username.text.isEmpty && password.text.isEmpty) {
      EasyLoading.showInfo("Los campos usuario y contraseña están vacios");
    } else if (username.text.isEmpty) {
      EasyLoading.showInfo("Campo usuario vacío");
    } else if (password.text.isEmpty) {
      EasyLoading.showInfo("Campo contraseña vacío");
    } else {
      if (username.text == "prueba" && password.text == "prueba4") {
        Get.offAllNamed("home_customer");
      } else {
        EasyLoading.showInfo("Credenciales incorrectas");
      }
    }
  }
}
