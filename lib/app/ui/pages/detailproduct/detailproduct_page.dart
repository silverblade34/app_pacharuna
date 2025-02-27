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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/campesino_login.png',
                    width: 20,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Text(
                        controller.product.producer.bussinesName.toUpperCase(),
                        style: const TextStyle(fontSize: 14)),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
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
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "Calcular costo",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Obx(
                () => Row(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: 100,
                          child: TextField(
                            textAlign: TextAlign.center,
                            controller: controller.amountProduct,
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              controller.selectButton(controller.selectedButton.value);
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text("Cantidad")
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "x",
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Text(
                          controller.priceSelected.value.toString(),
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text("Precio unitario")
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "=",
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      controller.totalPrice.value.toString(),
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
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
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
