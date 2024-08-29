import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:convert';

class GlobalMiddleware extends GetMiddleware {
  final box = GetStorage();

  @override
  RouteSettings? redirect(String? route) {
    final authTokenMobile = box.read("authTokenMobile");
    if (authTokenMobile != null) {
      bool statusAuthToken = _isTokenValid(authTokenMobile);
      Map<String, dynamic> payload = decodeToken(authTokenMobile);
      if (route == '/login' && !statusAuthToken) {
        GetStorage().erase();
        return null;
      } else if (route == '/login' && statusAuthToken) {
        String routeRedirect = redirectToAuthenticate(payload["role"]);
        return RouteSettings(name: routeRedirect);
      } else if (route == '/splash' && !statusAuthToken) {
        GetStorage().erase();
        return null;
      } else if (route == '/splash' && statusAuthToken) {
        String routeRedirect = redirectToAuthenticate(payload["role"]);
        return RouteSettings(name: routeRedirect);
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  bool _isTokenValid(String token) {
    // Decodificar el token y verificar la expiración
    Map<String, dynamic> decodedToken = json.decode(
      utf8.decode(base64.decode(token.split('.')[1])),
    );
    int expiryTimeSeconds = decodedToken['exp'];
    int currentTimeSeconds = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    return expiryTimeSeconds > currentTimeSeconds;
  }

  Map<String, dynamic> decodeToken(String token) {
    Map<String, dynamic> decodedToken = json.decode(
      utf8.decode(base64.decode(token.split('.')[1])),
    );
    return decodedToken;
  }

  String redirectToAuthenticate(String role) {
    if (role == "CUSTOMER") {
      return '/home_customer';
    } else if (role == "PRODUCER") {
      return '/home_producer';
    }
    return '/login';
  }
}
