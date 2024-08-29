import 'package:app_pacharuna/app/data/dto/auth_dto.dart';
import 'package:app_pacharuna/app/data/providers/login_provider.dart';

class LoginRepository {
  LoginProvider api = LoginProvider();

  Future<AuthDto> authLogin(String username, String password) async {
    final response = await api.authLogin(username, password);
    if (response.body == null) {
      throw Exception("No se recibieron datos en la respuesta");
    } else if (response.body["status"] == false) {
      throw Exception(response.body["message"]);
    }
    final body = response.body;
    AuthDto data = AuthDto.fromJson(body);
    return data;
  }
}
