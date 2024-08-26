import 'package:app_pacharuna/app/controllers/homecustomer_controller.dart';
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
        backgroundColor: GlobalColors.primary,
      ),
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
                        crossAxisCount: 2, // Número de columnas
                        crossAxisSpacing:
                            10, // Espacio horizontal entre tarjetas
                        mainAxisSpacing: 10, // Espacio vertical entre tarjetas
                        childAspectRatio:
                            0.7, // Ajusta la proporción de cada tarjeta
                      ),
                      itemCount: controller.products.length,
                      itemBuilder: (BuildContext context, int index) {
                        final product = controller.products[index];
                        return Card(
                          elevation: 3, // Sombra debajo de la tarjeta
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(15), // Borde redondeado
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                  ),
                                  child: Image.network(
                                    product
                                        .imageUrl, // URL de la imagen del producto
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.name, // Nombre del producto
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      '\$${product.price.toStringAsFixed(2)}', // Precio del producto
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    ElevatedButton(
                                      onPressed: () {
                                        // Acción al presionar el botón de detalle
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: GlobalColors.primary,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      child: const Text('Ver detalles'),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
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
