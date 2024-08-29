import 'package:app_pacharuna/app/utils/global_utils.dart';
import 'package:get/get.dart';

class RegisterProvider extends GetConnect {
  Future<Response> registerCustomer(Map<String, dynamic> payload) async {
    try {
      final response =
          await post('$url$versionService$methodRegisterCustomer', payload)
              .timeout(const Duration(milliseconds: 25000));
      return response;
    } catch (e) {
      throw Exception("Error de conexión al servidor");
    }
  }

  Future<Response> registerProducer(Map<String, dynamic> payload) async {
    try {
      final response =
          await post('$url$versionService$methodRegisterProducer', payload)
              .timeout(const Duration(milliseconds: 25000));
      return response;
    } catch (e) {
      throw Exception("Error de conexión al servidor");
    }
  }
}
