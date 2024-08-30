import 'package:app_pacharuna/app/controllers/createproduct_controller.dart';
import 'package:app_pacharuna/app/data/dto/categories_dto.dart';
import 'package:app_pacharuna/app/utils/global_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateProductPage extends GetView<CreateProductController> {
  const CreateProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Crear Producto',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.offAllNamed("/home_producer");
          },
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: GlobalColors.primary,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: const InputDecoration(labelText: 'Nombre'),
                  onChanged: (value) => controller.name.value = value,
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: const InputDecoration(labelText: 'Descripción'),
                  onChanged: (value) => controller.description.value = value,
                  maxLines: 3,
                ),
                const SizedBox(height: 16),
                Obx(() => DropdownButtonFormField<int>(
                      decoration: const InputDecoration(labelText: 'Categoría'),
                      value: controller.categoryId.value,
                      onChanged: (int? newValue) {
                        if (newValue != null) {
                          controller.categoryId.value = newValue;
                        }
                      },
                      items: [
                        const DropdownMenuItem<int>(
                          value: 0,
                          child: Text('SIN SELECCIONAR'),
                        ),
                        ...controller.categories.map((DatumCategory category) {
                          return DropdownMenuItem<int>(
                            value: category.id,
                            child: Text(category.name),
                          );
                        }),
                      ],
                    )),
                const SizedBox(height: 16),
                TextField(
                  decoration: const InputDecoration(labelText: 'Precio'),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => controller.price.value = value,
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: const InputDecoration(labelText: 'Stock'),
                  keyboardType: TextInputType.number,
                  onChanged: (value) =>
                      controller.stock.value = int.parse(value),
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: const InputDecoration(labelText: 'Unidad'),
                  onChanged: (value) => controller.unitExtent.value = value,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Imágenes',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    IconButton(
                      onPressed: controller.addImage,
                      icon: const Icon(Icons.add_a_photo),
                      color: GlobalColors.secondary,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Obx(() => Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: controller.images.map((image) {
                        return Stack(
                          children: [
                            Image.file(
                              image,
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                                style: const ButtonStyle(
                                  padding:
                                      WidgetStatePropertyAll(EdgeInsets.all(3)),
                                  backgroundColor:
                                      WidgetStatePropertyAll(Colors.red),
                                ),
                                onPressed: () => controller.removeImage(
                                    controller.images.indexOf(image)),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    )),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: controller.createProduct,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      textStyle: const TextStyle(fontSize: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: const Text(
                      'Crear Producto',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
