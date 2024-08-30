import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;
import 'package:app_pacharuna/app/utils/global_utils.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class UpdateProductProvider {
  final box = GetStorage();
  late String token;

  UpdateProductProvider() {
    token = box.read("token");
  }

  Future<Response> updateProduct(
    int productId,
    Map<String, dynamic> textFields,
    List<File> images,
  ) async {
    try {
      Dio dioClient = Dio();
      dioClient.options.headers['Authorization'] = 'Bearer $token';

      final formData = FormData.fromMap(textFields);

      if (images.isNotEmpty) {
        formData.files.addAll([
          for (var image in images)
            MapEntry(
              'images',
              await MultipartFile.fromFile(
                image.path,
                filename: path.basename(image.path),
                contentType: DioMediaType('image', 'jpeg'),
              ),
            ),
        ]);
      }

      final response = await dioClient
          .patch(
            '$url$versionService$methodUpdateProduct$productId',
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

  Future<Response> deleteImagesProduct(
      int productId, List<int> imagesId) async {
    try {
      Dio dioClient = Dio();
      dioClient.options.headers['Authorization'] = 'Bearer $token';
      print("-------------------------------");
      print(imagesId);
      print("-------------------------------");
      print('$url$versionService$methodDeleteImagesProduct$productId');
      final response = await dioClient.delete(
          '$url$versionService$methodDeleteImagesProduct$productId',
          data: {
            "imageIds": imagesId
          }).timeout(const Duration(milliseconds: 25000));

      return response;
    } catch (e) {
      throw Exception("Error de conexión al servidor: $e");
    }
  }
}
