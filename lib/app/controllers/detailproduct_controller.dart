import 'package:app_pacharuna/app/data/dto/products_dto.dart';
import 'package:app_pacharuna/app/data/repositories/detailproduct_repository.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

class DetailProductController extends GetxController {
  var amountProduct = 0.obs;
  DatumProduct product = Get.arguments;
  var selectedButton = ''.obs;
  DetailProductRepository detailProductRepository = DetailProductRepository();

  void selectButton(String buttonLabel) {
    selectedButton.value = buttonLabel;
  }

  String capitalizeFirstLetter(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  createSale() async {
    if (selectedButton.value != "" && amountProduct.value != 0) {
      EasyLoading.show(status: "Cargando...");
      Map<String, dynamic> dataSale = {
        "product_id": product.productId,
        "amount": amountProduct.value,
        "extend_id": product.unitExtentId
      };
      await detailProductRepository.createSales(dataSale);
      String message =
          "Hola, estoy interesado en ${amountProduct.value} ${selectedButton.value} de ${product.name}.";
      String phoneNumber = "+51${product.producer.phone}";
      String urlString =
          "https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}";
      Uri url = Uri.parse(urlString);
      await launchUrl(url);
      EasyLoading.dismiss();
    } else {
      EasyLoading.showInfo(
          "Debe seleccionar una unidad de medida y una cantidad valida");
    }
  }
}
