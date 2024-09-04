import 'dart:io';
import 'package:app_pacharuna/app/data/providers/shoppingdetailcustomer_provider.dart';

class ShoppingdetailcustomerRepository {
  ShoppingdetailcustomerProvider api = ShoppingdetailcustomerProvider();

 Future<dynamic> updatePaySale(int saleId, List<File> images) async {
    final response = await api.updatePaySale(saleId, images);
    if (response.data == null) {
      throw Exception("No se recibieron datos en la respuesta");
    } else if (response.data["status"] == false) {
      throw Exception(response.data["message"]);
    }
    final body = response.data;
    return body;
  }
}