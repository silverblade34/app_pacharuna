import 'dart:convert';

import 'package:app_pacharuna/app/data/dto/datasales_dto.dart';
import 'package:app_pacharuna/app/data/providers/shoppingcustomer_provider.dart';

class ShoppingCustomerRepository {
  ShoppingCustomerProvider api = ShoppingCustomerProvider();

  Future<DataSalesDto> findAllSales() async {
    final response = await api.findAllSales();
    print("------------------------------------------");
    print(jsonEncode(response.body));
    if (response.body == null) {
      throw Exception("No se recibieron datos en la respuesta");
    } else if (response.body["status"] == false) {
      throw Exception(response.body["message"]);
    }
    final body = response.body;
    DataSalesDto data = DataSalesDto.fromJson(body);
    return data;
  }
}
