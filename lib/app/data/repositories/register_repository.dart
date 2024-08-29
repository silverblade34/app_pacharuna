import 'package:app_pacharuna/app/data/providers/register_provider.dart';

class RegisterRepository {
  RegisterProvider api = RegisterProvider();

  Future<dynamic> registerCustomer(Map<String, dynamic> dataCustomer) async {
    final response = await api.registerCustomer(dataCustomer);
    if (response.body == null) {
      throw Exception("No se recibieron datos en la respuesta");
    } else if (response.body["status"] == false) {
      throw Exception(response.body["message"]);
    }
    final body = response.body;
    return body;
  }

  Future<dynamic> registerProducer(Map<String, dynamic> dataProducer) async {
    final response = await api.registerProducer(dataProducer);
    if (response.body == null) {
      throw Exception("No se recibieron datos en la respuesta");
    } else if (response.body["status"] == false) {
      throw Exception(response.body["message"]);
    }
    final body = response.body;
    return body;
  }
}
