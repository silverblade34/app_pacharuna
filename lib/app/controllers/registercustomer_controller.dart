import 'package:app_pacharuna/app/data/repositories/register_Repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RegisterCustomerController extends GetxController {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController bussinesName = TextEditingController();
  TextEditingController document = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  RxBool obscurePass = RxBool(true);
  final box = GetStorage();

  RegisterRepository registerRepository = RegisterRepository();

  registerCustomer() async {
    try {
      EasyLoading.show(status: "Cargando...");
      if (firstName.text != "" &&
          lastName.text != "" &&
          document.text != "" &&
          phone.text != "" &&
          username.text != "" &&
          password.text != "") {
        Map<String, dynamic> dataCustomer = {
          "username": username.text,
          "password": password.text,
          "firstName": firstName.text,
          "lastName": lastName.text,
          "bussinesName": bussinesName.text,
          "phone": phone.text,
          "document": document.text
        };
        await registerRepository.registerCustomer(dataCustomer);
        EasyLoading.showSuccess("Se ha creado correctamente la cuenta cliente");
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
