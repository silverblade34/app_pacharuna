import 'package:app_pacharuna/app/data/repositories/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  LoginRepository loginRepository = LoginRepository();
  final box = GetStorage();

  validateUser() async {
    if (username.text.isEmpty && password.text.isEmpty) {
      EasyLoading.showInfo("Los campos usuario y contraseña están vacios");
    } else if (username.text.isEmpty) {
      EasyLoading.showInfo("Campo usuario vacío");
    } else if (password.text.isEmpty) {
      EasyLoading.showInfo("Campo contraseña vacío");
    } else {
      EasyLoading.show(status: 'Cargando...');
      try {
        final validate = await loginRepository.authLogin(
            username.text.trim(), password.text.trim());
        String role = validate.data.role;

        box.write('authToken', validate.data.token);
        box.write('name', validate.data.username);
        box.write('role', role);
        box.write('token', validate.data.token);
        EasyLoading.dismiss();
        if (role == "CUSTOMER") {
          Get.offAllNamed("/home_customer");
        } else if (role == "PRODUCER") {
          Get.offAllNamed("/home_producer");
        } else {
          EasyLoading.showInfo("El role no esta identificado.");
        }
      } catch (error) {
        try {
          String errorMessage = error.toString().split(":")[1].trim();
          EasyLoading.showInfo(errorMessage);
        } catch (e) {
          EasyLoading.showInfo(error.toString());
        }
      }
    }
  }
}
