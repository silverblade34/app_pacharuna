import 'package:app_pacharuna/app/data/dto/products_dto.dart';
import 'package:app_pacharuna/app/data/repositories/homecustomer_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomecustomerController extends GetxController {
  RxString valueCategoryDropdown = RxString('0');
  TextEditingController searchProduct = TextEditingController();
  HomeCustomerRepository homeCustomerRepository = HomeCustomerRepository();

  RxList<DropdownMenuItem<String>> itemsCategories =
      RxList<DropdownMenuItem<String>>(
    [
      const DropdownMenuItem(
        value: "0",
        child: Text(
          "SELECCIONAR",
          textAlign: TextAlign.center,
        ),
      ),
      const DropdownMenuItem(
        value: "FRUTA",
        child: Text(
          "FRUTAS",
          textAlign: TextAlign.center,
        ),
      ),
      const DropdownMenuItem(
        value: "VERDURAS",
        child: Text(
          "VERDURAS",
          textAlign: TextAlign.center,
        ),
      ),
    ],
  );

  RxList<DatumProduct> products = RxList<DatumProduct>([]);

  @override
  void onInit() async {
    super.onInit();
    await getProducts();
  }

  getProducts() async {
    final validate = await homeCustomerRepository.findAllProducts();
    products.value = validate.data;
  }
}
