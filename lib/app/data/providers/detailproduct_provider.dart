import 'package:app_pacharuna/app/utils/global_utils.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DetailProductProvider extends GetConnect {
  final box = GetStorage();
  late String token;

  DetailProductProvider() {
    token = box.read("token");
  }

  Future<Response> createSales(Map<String, dynamic> payload) async {
    try {
      Map<String, String> headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };
      final response = await post(
              '$url$versionService$methodSalesCreate', payload,
              headers: headers)
          .timeout(const Duration(milliseconds: 25000));
      return response;
    } catch (e) {
      throw Exception("Error de conexión al servidor");
    }
  }

  Future<Response> findOneProducts(int productId) async {
    try {
      final response = await get('$url$versionService$methodFindOneProduct$productId')
          .timeout(const Duration(milliseconds: 25000));
      return response;
    } catch (e) {
      throw Exception("Error de conexión al servidor");
    }
  }
}
