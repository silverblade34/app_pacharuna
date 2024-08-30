import 'dart:io';

import 'package:app_pacharuna/app/data/providers/updateproduct_provider.dart';

class UpdateProductRepository {
  UpdateProductProvider api = UpdateProductProvider();

  Future<dynamic> updateProduct(
      int productId, Map<String, dynamic> textFields, List<File> images) async {
    final response = await api.updateProduct(productId, textFields, images);
    if (response.data == null) {
      throw Exception("No se recibieron datos en la respuesta");
    } else if (response.data["status"] == false) {
      throw Exception(response.data["message"]);
    }
    final body = response.data;
    return body;
  }
}
