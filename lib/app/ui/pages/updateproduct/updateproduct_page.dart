import 'dart:io';

import 'package:app_pacharuna/app/controllers/updateproduct_controller.dart';
import 'package:app_pacharuna/app/data/dto/categories_dto.dart';
import 'package:app_pacharuna/app/utils/global_colors.dart';
import 'package:app_pacharuna/app/utils/global_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProductPage extends GetView<UpdateProductController> {
  const UpdateProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Editar Producto',
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
                  controller:
                      TextEditingController(text: controller.name.value),
                  onChanged: (value) => controller.name.value = value,
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: const InputDecoration(labelText: 'Descripción'),
                  controller:
                      TextEditingController(text: controller.description.value),
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
                      items:
                          controller.categories.map((DatumCategory category) {
                        return DropdownMenuItem<int>(
                          value: category.id,
                          child: Text(category.name),
                        );
                      }).toList(),
                    )),
                const SizedBox(height: 16),
                Obx(() => DropdownButtonFormField<String>(
                      decoration: const InputDecoration(labelText: 'Unidad'),
                      value: controller.unitExtent.value.isEmpty
                          ? 'SIN SELECCIONAR'
                          : controller.unitExtent.value,
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          controller.unitExtent.value = newValue;
                        }
                      },
                      items: <String>['SIN SELECCIONAR', 'Kg', 'Tn']
                          .map((String unit) {
                        return DropdownMenuItem<String>(
                          value: unit,
                          child: Text(unit),
                        );
                      }).toList(),
                    )),
                const SizedBox(height: 16),
                TextField(
                  decoration: const InputDecoration(labelText: 'Precio'),
                  controller:
                      TextEditingController(text: controller.price.value),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => controller.price.value = value,
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: const InputDecoration(labelText: 'Stock'),
                  controller: TextEditingController(
                      text: controller.stock.value.toString()),
                  keyboardType: TextInputType.number,
                  onChanged: (value) =>
                      controller.stock.value = int.parse(value),
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
                            image.type == "NETWORK"
                                ? Image.network(
                                    '$url$versionService$methodGetImages${image.path}',
                                    width: 120,
                                    height: 120,
                                    fit: BoxFit.cover,
                                  )
                                : Image.file(
                                    File(image.path),
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
                    onPressed: controller.updateProduct,
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
                      'Guardar Cambios',
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
