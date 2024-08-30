import 'dart:io';

import 'package:app_pacharuna/app/data/providers/createproduct_provider.dart';

class CreateProductRepository {
  CreateProductProvider api = CreateProductProvider();

 Future<dynamic> createProduct(Map<String, dynamic> textFields, List<File> images) async {
    final response = await api.createProduct(textFields, images);
    if (response.data == null) {
      throw Exception("No se recibieron datos en la respuesta");
    } else if (response.data["status"] == false) {
      throw Exception(response.data["message"]);
    }
    final body = response.data;
    return body;
  }
}