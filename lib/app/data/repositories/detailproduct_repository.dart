import 'package:app_pacharuna/app/data/dto/products_dto.dart';
import 'package:app_pacharuna/app/data/providers/detailproduct_provider.dart';

class DetailProductRepository {
  DetailProductProvider api = DetailProductProvider();

  Future<dynamic> createSales(Map<String, dynamic> dataSale) async {
    final response = await api.createSales(dataSale);
    if (response.body == null) {
      throw Exception("No se recibieron datos en la respuesta");
    } else if (response.body["status"] == false) {
      throw Exception(response.body["message"]);
    }
    final body = response.body;
    return body;
  }

   Future<DatumProduct> findOneProducts(int productId) async {
    final response = await api.findOneProducts(productId);
    if (response.body == null) {
      throw Exception("No se recibieron datos en la respuesta");
    } else if (response.body["status"] == false) {
      throw Exception(response.body["message"]);
    }
    final body = response.body;
    DatumProduct data = DatumProduct.fromJson(body.data);
    return data;
  }
}
