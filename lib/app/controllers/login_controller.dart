import 'package:app_pacharuna/app/data/models/menuoptions_model.dart';
import 'package:app_pacharuna/app/data/repositories/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:convert';

class LoginController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  LoginRepository loginRepository = LoginRepository();
  RxBool obscurePass = RxBool(true);
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
        constructMenu(role);
        String authToken = generateToken(validate.data.username, role);

        box.write('authTokenMobile', authToken);
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

  String generateToken(String username, String role) {
    // Generar token JWT con expiración de 10 horas
    int expiryTimeSeconds =
        DateTime.now().add(const Duration(hours: 10)).millisecondsSinceEpoch ~/
            1000;
    Map<String, dynamic> payload = {
      'exp': expiryTimeSeconds,
      'username': username,
      'role': role
    };
    String payloadString = base64.encode(utf8.encode(json.encode(payload)));
    String token = 'header.$payloadString.signature';
    return token;
  }

  constructMenu(String role) {
    List<MenuOptionsModel> pages = [];
    String perfil = "Invitado";

    if (role == "CUSTOMER") {
      pages.add(
        MenuOptionsModel(
          title: 'Productos',
          route: '/home_customer',
        ),
      );
      pages.add(
        MenuOptionsModel(
          title: 'Compras',
          route: '/shopping_customer',
        ),
      );
      perfil = "Cliente";
    } else if (role == "PRODUCER") {
      pages.add(
        MenuOptionsModel(
          title: 'Home',
          route: '/home_producer',
        ),
      );
      pages.add(
        MenuOptionsModel(
          title: 'Ventas',
          route: '/shopping_producer',
        ),
      );
      perfil = "Agricultor";
    }

    pages.add(
      MenuOptionsModel(
        title: 'Cerrar Sesión',
        route: '/logout',
      ),
    );
    box.write('perfil', perfil);
    box.write('menuOptions', pages);
  }
}
