import 'package:app_pacharuna/app/utils/global_utils.dart';
import 'package:get/get.dart';

class GeneralProvider extends GetConnect {
  Future<Response> getCategories() async {
    try {
      final response = await get('$url$versionService$methodFindAllCategories')
          .timeout(const Duration(milliseconds: 25000));
      return response;
    } catch (e) {
      throw Exception("Error de conexión al servidor");
    }
  }
}
