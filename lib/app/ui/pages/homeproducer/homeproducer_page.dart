import 'package:app_pacharuna/app/controllers/homeproducer_controller.dart';
import 'package:app_pacharuna/app/data/dto/productsproducer_dto.dart';
import 'package:app_pacharuna/app/ui/pages/homecustomer/widgets/card_product.dart';
import 'package:app_pacharuna/app/ui/widgets/navigation_drawer.dart';
import 'package:app_pacharuna/app/utils/global_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeProducerPage extends GetView<HomeProducerController> {
  const HomeProducerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mis productos',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: GlobalColors.primary,
      ),
      drawer: const NavigationDrawerLayout(),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller.searchProduct,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        hintText: "Buscar",
                      ),
                      onChanged: (text) {
                        controller.filterProducts();
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Obx(
                    () => Expanded(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: controller.valueCategoryDropdown.value,
                        underline: Container(color: Colors.transparent),
                        items: controller.itemsCategories,
                        onChanged: (String? newValue) async {
                          if (newValue != null) {
                            controller.valueCategoryDropdown.value = newValue;
                            controller.filterProducts();
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Obx(
                  () {
                    if (controller.isLoading.value) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: controller.productsFilter.length,
                      itemBuilder: (BuildContext context, int index) {
                        DatumProductProducer product =
                            controller.productsFilter[index];
                        return CardProduct(
                            textButton: "Editar",
                            datumProduct: product,
                            deleteButton: true,
                            onPressedDelete: () {
                              print("ELIMINAR PRODUCTO...");
                            },
                            onPressed: () {
                              controller.goToUpdateProduct(product);
                            });
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Semantics(
        label: 'Ir a la pantalla principal después de la configuración',
        child: FloatingActionButton.extended(
          onPressed: () async {
            Get.offAllNamed("create_product");
          },
          backgroundColor: GlobalColors.terciary,
          label: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.add,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
