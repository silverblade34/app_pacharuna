import 'package:app_pacharuna/app/data/providers/shoppingdetailproducer_provider.dart';

class ShoppingdetailproducerRepository {
  ShoppingdetailproducerProvider api = ShoppingdetailproducerProvider();

  Future<dynamic> deleteSale(int saleId) async {
    final response = await api.deleteSale(saleId);
    if (response.body == null) {
      throw Exception("No se recibieron datos en la respuesta");
    } else if (response.body["status"] == false) {
      throw Exception(response.body["message"]);
    }
    final body = response.body;
    return body;
  }

  Future<dynamic> activateSale(int saleId, String status) async {
    final response = await api.activateSale(saleId, status);
    if (response.statusCode == 400) {
      throw Exception("Ha sucedido un error al aprobar la venta");
    }
    final body = response.body;
    return body;
  }
}
