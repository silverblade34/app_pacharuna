import 'package:app_pacharuna/app/controllers/detailproduct_controller.dart';
import 'package:app_pacharuna/app/ui/pages/detailproduct/widgets/image_carousel.dart';
import 'package:app_pacharuna/app/ui/pages/detailproduct/widgets/product_description.dart';
import 'package:app_pacharuna/app/ui/pages/detailproduct/widgets/textbutton_unit.dart';
import 'package:app_pacharuna/app/utils/global_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailProductPage extends GetView<DetailProductController> {
  const DetailProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        // actions: [
        //   IconButton(
        //       icon: const Icon(
        //         Icons.shopping_cart_outlined,
        //         color: Colors.white,
        //       ),
        //       onPressed: () {}),
        // ],
        backgroundColor: GlobalColors.primary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildImageCarousel(controller.product.images),
              const SizedBox(height: 16),
              Text(
                controller.capitalizeFirstLetter(controller.product.name),
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber),
                  const Text("4.9 Puntaje", style: TextStyle(fontSize: 16)),
                  const Spacer(),
                  Text(
                    "S/ ${controller.product.price} (${controller.product.unitExtent})",
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              buildProductDescription(controller.product.description),
              const SizedBox(height: 16),
              const Text(
                "Unidad de medida",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  TextButtonUnit(controller: controller, typeUnit: 'Kg'),
                  const SizedBox(width: 10),
                  TextButtonUnit(controller: controller, typeUnit: 'Tn'),
                  const SizedBox(width: 10),
                  TextButtonUnit(controller: controller, typeUnit: 'Lb'),
                ],
              ),
              const SizedBox(height: 20),
              Obx(
                () => Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (controller.amountProduct.value != 0) {
                          controller.amountProduct.value =
                              controller.amountProduct.value - 1;
                        }
                      },
                      child: Container(
                        height: 45,
                        width: 45,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: GlobalColors.primary),
                        child: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                      child: Text(
                        controller.amountProduct.value.toString(),
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: GlobalColors.greyHard),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.amountProduct.value =
                            controller.amountProduct.value + 1;
                      },
                      child: Container(
                        height: 45,
                        width: 45,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: GlobalColors.primary),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          controller.createSale();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          decoration: BoxDecoration(
                            color: GlobalColors.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            'Comprar',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
