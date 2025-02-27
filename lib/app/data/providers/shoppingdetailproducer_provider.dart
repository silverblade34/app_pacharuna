import 'package:app_pacharuna/app/utils/global_utils.dart';
import 'package:get_storage/get_storage.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class ShoppingdetailproducerProvider extends GetConnect {
  final box = GetStorage();
  late String token;

  ShoppingdetailproducerProvider() {
    token = box.read("token");
  }

  Future<Response> deleteSale(int saleId) async {
    try {
      Map<String, String> headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };
      final response = await delete(
              '$url$versionService$methodUpdateSales$saleId',
              headers: headers)
          .timeout(const Duration(milliseconds: 25000));
      return response;
    } catch (e) {
      throw Exception("Error de conexión al servidor");
    }
  }

  Future<http.Response> activateSale(int saleId,String status) async {
    try {
      Map<String, String> headers = {
        'Authorization': 'Bearer $token',
        'Content-Type':
            'multipart/form-data', // Cambia el content-type a multipart/form-data
      };

      // Crea el cuerpo de la solicitud como form-data
      var request = http.MultipartRequest(
          'PATCH', Uri.parse('$url$versionService$methodUpdateSales$saleId'));

      request.headers.addAll(headers);
      request.fields['status'] = status;

      // Envía la solicitud y espera la respuesta
      final response =
          await request.send().timeout(const Duration(milliseconds: 25000));

      // Convierte la respuesta a un objeto Response
      final http.Response streamedResponse =
          await http.Response.fromStream(response);
      return streamedResponse;
    } catch (e) {
      throw Exception("Error de conexión al servidor");
    }
  }
}
