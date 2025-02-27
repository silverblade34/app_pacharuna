import 'package:app_pacharuna/app/data/dto/products_dto.dart';
import 'package:app_pacharuna/app/data/repositories/detailproduct_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

class DetailProductController extends GetxController {
  DatumProduct product = Get.arguments;
  var selectedButton = 'Kg'.obs;
  DetailProductRepository detailProductRepository = DetailProductRepository();
  final box = GetStorage();
  TextEditingController amountProduct = TextEditingController(text: "0");
  var priceSelected = 0.0.obs;
  var totalPrice = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    selectedButton.value = product.unitExtent;
    priceSelected.value = double.parse(product.price);
  }

  void selectButton(String buttonLabel) {
    int amount = amountProduct.text == "" ? 0 : int.parse(amountProduct.text);

    double price = amount > product.bulkQuantity
        ? (product.bulkPrice is String
            ? double.parse(product.bulkPrice)
            : product.bulkPrice.toDouble())
        : double.parse(product.price);

    if (buttonLabel == product.unitExtent) {
      priceSelected.value = price;
    } else {
      if (product.unitExtent == "Kg") {
        priceSelected.value = price / 1000;
      } else {
        priceSelected.value = price * 1000;
      }
    }
    totalPrice.value =
        double.parse((amount * priceSelected.value).toStringAsFixed(2));
    selectedButton.value = buttonLabel;
  }

  String capitalizeFirstLetter(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  createSale() async {
    if (selectedButton.value != "" && amountProduct.text != "") {
      EasyLoading.show(status: "Cargando...");
      Map<String, dynamic> dataSale = {
        "product_id": product.productId,
        "amount": int.parse(amountProduct.text),
        "extend_id": product.unitExtentId
      };
      String nameCustomer = box.read("name");
      String direction = box.read("direction");
      await detailProductRepository.createSales(dataSale);
      String message =
          "Hola, estoy interesado en ${amountProduct.text} ${selectedButton.value} de ${product.name}. Mi nombre es $nameCustomer y soy de $direction";
      String phoneNumber = "+51${product.producer.phone}";
      String urlString =
          "https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}";
      Uri url = Uri.parse(urlString);
      await launchUrl(url);
      Get.offAllNamed("/shopping_customer");
      EasyLoading.dismiss();
    } else {
      EasyLoading.showInfo(
          "Debe seleccionar una unidad de medida y una cantidad valida");
    }
  }
}
