import 'package:app_pacharuna/app/data/providers/createproduct_provider.dart';

class CreateProductRepository {
  CreateProductProvider api = CreateProductProvider();

 Future<dynamic> createProduct(Map<String, dynamic> dataProduct) async {
    final response = await api.createProduct(dataProduct);
    if (response.body == null) {
      throw Exception("No se recibieron datos en la respuesta");
    } else if (response.body["status"] == false) {
      throw Exception(response.body["message"]);
    }
    final body = response.body;
    return body;
  }

}