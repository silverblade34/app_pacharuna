import 'package:app_pacharuna/app/data/dto/categories_dto.dart';
import 'package:app_pacharuna/app/data/dto/products_dto.dart';
import 'package:app_pacharuna/app/data/repositories/general_repository.dart';
import 'package:app_pacharuna/app/data/repositories/homecustomer_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomecustomerController extends GetxController {
  RxString valueCategoryDropdown = RxString('0');
  TextEditingController searchProduct = TextEditingController();
  HomeCustomerRepository homeCustomerRepository = HomeCustomerRepository();
  GeneralRepository generalRepository = GeneralRepository();
  RxList<DatumProduct> products = RxList<DatumProduct>([]);
  RxList<DatumProduct> productsFilter = RxList<DatumProduct>([]);
  RxList<DatumCategory> categories = RxList<DatumCategory>([]);
  RxBool isLoading = true.obs;

  RxList<DropdownMenuItem<String>> itemsCategories =
      RxList<DropdownMenuItem<String>>(
    [
      const DropdownMenuItem(
        value: "0",
        child: Text(
          "TODOS",
          textAlign: TextAlign.center,
        ),
      ),
    ],
  );

  @override
  void onInit() async {
    super.onInit();
    await getProducts();
    await getCategories();
    isLoading.value = false;
  }

  getCategories() async {
    final validate = await generalRepository.getCategories();
    categories.value = validate.data;
    itemsCategories.value = categories.map((category) {
      return DropdownMenuItem<String>(
        value: category.id.toString(),
        child: Text(
          category.name,
          textAlign: TextAlign.center,
        ),
      );
    }).toList();

    itemsCategories.insert(
        0,
        const DropdownMenuItem(
          value: "0",
          child: Text(
            "TODOS",
            textAlign: TextAlign.center,
          ),
        ));
  }

  getProducts() async {
    final validate = await homeCustomerRepository.findAllProducts();
    products.value = validate.data;
    productsFilter.value = validate.data;
  }

  goToDetailsProduct(DatumProduct product) async {
    Get.toNamed("/detail_product", arguments: product);
  }

  filterProducts() {
    String searchText = searchProduct.text.toLowerCase();
    productsFilter.value = products.where((product) {
      final matchesCategory = valueCategoryDropdown.value == "0" ||
          product.categoryId.toString() == valueCategoryDropdown.value;
      final matchesSearchText =
          searchText.isEmpty || product.name.toLowerCase().contains(searchText);
      return matchesCategory && matchesSearchText;
    }).toList();
  }
}
