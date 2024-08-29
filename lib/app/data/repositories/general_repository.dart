import 'package:app_pacharuna/app/data/dto/categories_dto.dart';
import 'package:app_pacharuna/app/data/providers/general_provider.dart';

class GeneralRepository {
  GeneralProvider api = GeneralProvider();

  Future<CategoriesDto> getCategories() async {
    final response = await api.getCategories();
    if (response.body == null) {
      throw Exception("No se recibieron datos en la respuesta");
    } else if (response.body["status"] == false) {
      throw Exception(response.body["message"]);
    }
    final body = response.body;
    CategoriesDto data = CategoriesDto.fromJson(body);
    return data;
  }
}
