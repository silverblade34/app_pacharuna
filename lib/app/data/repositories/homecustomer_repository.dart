
import 'package:app_pacharuna/app/data/dto/products_dto.dart';
import 'package:app_pacharuna/app/data/providers/homecustomer_provider.dart';

class HomeCustomerRepository {
  HomeCustomerProvider api = HomeCustomerProvider();

  Future<ProductsDto> findAllProducts() async {
    final response = await api.findAllProducts();
    if (response.body == null) {
      throw Exception("No se recibieron datos en la respuesta");
    } else if (response.body["status"] == false) {
      throw Exception(response.body["message"]);
    }
    final body = response.body;
    ProductsDto data = ProductsDto.fromJson(body);
    return data;
  }
}