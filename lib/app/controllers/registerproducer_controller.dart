import 'package:app_pacharuna/app/data/repositories/register_Repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RegisterProducerController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController bussinesName = TextEditingController();
  TextEditingController document = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  RxBool obscurePass = RxBool(true);
  final box = GetStorage();

  RegisterRepository registerRepository = RegisterRepository();

  registerProducer() async {
    try {
      EasyLoading.show(status: "Cargando...");
      if (name.text != "" &&
          document.text != "" &&
          phone.text != "" &&
          username.text != "" &&
          password.text != "") {
        Map<String, dynamic> dataProducer = {
          "username": username.text,
          "password": password.text,
          "name": name.text,
          "bussinesName": bussinesName.text,
          "phone": phone.text,
          "document": document.text
        };
        await registerRepository.registerProducer(dataProducer);
        EasyLoading.showSuccess(
            "Se ha creado correctamente la cuenta productor");
        Future.delayed(const Duration(seconds: 1), () {
          Get.offAllNamed("/login");
        });
      } else {
        EasyLoading.showInfo("Debe rellenar los campos que son obligatorios");
      }
    } catch (e) {
      EasyLoading.showInfo(e.toString());
    }
  }
}
