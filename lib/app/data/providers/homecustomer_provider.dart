import 'package:app_pacharuna/app/utils/global_utils.dart';
import 'package:get/get.dart';

class HomeCustomerProvider extends GetConnect {

  Future<Response> findAllProducts() async {
    try {
      final response = await get('$url$versionService$methodFindAllProducts')
          .timeout(const Duration(milliseconds: 25000));
      return response;
    } catch (e) {
      throw Exception("Error de conexión al servidor");
    }
  }
}