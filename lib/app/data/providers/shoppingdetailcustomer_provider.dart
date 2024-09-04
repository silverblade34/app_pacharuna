import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;
import 'package:app_pacharuna/app/utils/global_utils.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class ShoppingdetailcustomerProvider {
  final box = GetStorage();
  late String token;

  ShoppingdetailcustomerProvider() {
    token = box.read("token");
  }

  Future<Response> updatePaySale(
    int saleId,
    List<File> images,
  ) async {
    try {
      Dio dioClient = Dio();
      dioClient.options.headers['Authorization'] = 'Bearer $token';

       final formData = FormData.fromMap(
        {
          'payment': [
            for (var image in images)
              await MultipartFile.fromFile(
                image.path,
                filename: path.basename(image.path),
                contentType: DioMediaType('image', 'jpeg'),
              ),
          ],
        },
      );

      final response = await dioClient
          .post(
            '$url$versionService$methodSalesUpdateCustomer$saleId',
            data: formData,
            options: Options(
              contentType: 'multipart/form-data',
            ),
          )
          .timeout(const Duration(milliseconds: 25000));

      return response;
    } catch (e) {
      throw Exception("Error de conexión al servidor: $e");
    }
  }
}
