import 'package:app_pacharuna/app/data/dto/productsproducer_dto.dart';
import 'package:app_pacharuna/app/data/providers/homeproducer_provider.dart';

class HomeProducerRepository {
  HomeProducerProvider api = HomeProducerProvider();

  Future<ProductsProducerDto> findAllProducts() async {
    final response = await api.findAllProducts();
    if (response.body == null) {
      throw Exception("No se recibieron datos en la respuesta");
    } else if (response.body["status"] == false) {
      throw Exception(response.body["message"]);
    }
    final body = response.body;
    ProductsProducerDto data = ProductsProducerDto.fromJson(body);
    return data;
  }
}
