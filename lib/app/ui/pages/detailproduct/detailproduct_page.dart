import 'package:app_pacharuna/app/controllers/detailproduct_controller.dart';
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
        actions: [
          IconButton(
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
              ),
              onPressed: () {}),
        ],
        backgroundColor: GlobalColors.primary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Carrusel de imágenes del producto
              _buildImageCarousel(),
              const SizedBox(height: 16),
              const Text(
                "Manzana Ana de Israel",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Row(
                children: [
                  Icon(Icons.star, color: Colors.amber),
                  Text("4.9 Puntaje", style: TextStyle(fontSize: 16)),
                  Spacer(),
                  Text(
                    "\$ 18.00 (Kg)",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildProductDescription(),
              const SizedBox(height: 16),
              const Text(
                "Unidad de medida",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Kg',
                      style: TextStyle(color: Color.fromARGB(255, 66, 66, 66)),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 233, 233, 233),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 15,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Tn',
                      style: TextStyle(color: Color.fromARGB(255, 66, 66, 66)),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 233, 233, 233),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 15,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Lb',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 118, 175, 221),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 15,
                      ),
                    ),
                  ),
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
                            color: GlobalColors.secondary),
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
                            color: GlobalColors.secondary),
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
                        onTap: () {},
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

  Widget _buildImageCarousel() {
    return SizedBox(
      height: 250,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildProductImage('assets/images/cosecha1.jpg'),
          _buildProductImage('assets/images/cosecha2.jpg'),
          _buildProductImage('assets/images/cosecha3.jpg'),
        ],
      ),
    );
  }

  Widget _buildProductImage(String imagePath) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildProductDescription() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Descripción",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Text(
          "Se pone a su disposición manzanas Ana de Israel lo llevamos hasta tu puesto de mercado o a tu domicilio, 3Kg, 5Kg, 10Kg a más; 5, 7, 8, 9  soles Kg según tamaño o selección",
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
