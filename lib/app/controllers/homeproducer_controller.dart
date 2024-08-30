import 'package:app_pacharuna/app/data/dto/categories_dto.dart';
import 'package:app_pacharuna/app/data/dto/productsproducer_dto.dart';
import 'package:app_pacharuna/app/data/repositories/general_repository.dart';
import 'package:app_pacharuna/app/data/repositories/homeproducer_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomeProducerController extends GetxController {
  RxString valueCategoryDropdown = RxString('0');
  TextEditingController searchProduct = TextEditingController();
  HomeProducerRepository homeProducerRepository = HomeProducerRepository();
  GeneralRepository generalRepository = GeneralRepository();
  RxList<DatumProductProducer> products = RxList<DatumProductProducer>([]);
  RxList<DatumProductProducer> productsFilter = RxList<DatumProductProducer>([]);
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
    final validate = await homeProducerRepository.findAllProducts();
    products.value = validate.data;
    productsFilter.value = validate.data;
  }

  goToUpdateProduct(DatumProductProducer product) async {
    Get.offAllNamed("/update_product", arguments: product);
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