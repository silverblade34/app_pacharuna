import 'package:app_pacharuna/app/controllers/homecustomer_controller.dart';
import 'package:app_pacharuna/app/data/dto/products_dto.dart';
import 'package:app_pacharuna/app/ui/pages/homecustomer/widgets/card_product.dart';
import 'package:app_pacharuna/app/ui/widgets/navigation_drawer.dart';
import 'package:app_pacharuna/app/utils/global_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomecustomerPage extends GetView<HomecustomerController> {
  const HomecustomerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Productos',
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
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          hintText: "Buscar"),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: controller.valueCategoryDropdown.value,
                      underline: Container(color: Colors.transparent),
                      items: controller.itemsCategories,
                      onChanged: (String? newValue) async {
                        if (newValue != null) {
                          controller.valueCategoryDropdown.value = newValue;
                        }
                      },
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
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: controller.products.length,
                      itemBuilder: (BuildContext context, int index) {
                        DatumProduct product = controller.products[index];
                        return CardProduct(
                            datumProduct: product,
                            onPressed: () {
                              Get.toNamed("/detail_product");
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
    );
  }
}
