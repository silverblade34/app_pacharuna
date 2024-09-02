import 'package:app_pacharuna/app/utils/global_utils.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ShoppingCustomerProvider extends GetConnect {
  final box = GetStorage();
  late String token;

  ShoppingCustomerProvider() {
    token = box.read("token");
  }

  Future<Response> findAllSales() async {
    try {
      Map<String, String> headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };
      final response = await get(
              '$url$versionService$methodFindAllSales',
              headers: headers)
          .timeout(const Duration(milliseconds: 25000));
      return response;
    } catch (e) {
      throw Exception("Error de conexión al servidor");
    }
  }
}
