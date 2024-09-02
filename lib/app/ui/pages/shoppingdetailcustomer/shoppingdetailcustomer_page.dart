import 'package:app_pacharuna/app/controllers/shoppingdetailcustomer_controller.dart';
import 'package:app_pacharuna/app/utils/global_colors.dart';
import 'package:app_pacharuna/app/utils/global_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppingDetailCustomerPage
    extends GetView<ShoppingDetailCustomerController> {
  const ShoppingDetailCustomerPage({super.key});

  Color getStatusColor(String status) {
    switch (status) {
      case 'solicitado':
        return Colors.orange;
      case 'activo':
        return Colors.blue;
      case 'aprobado':
        return Colors.green;
      case 'culminado':
        return Colors.grey;
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Get.offAllNamed("/shopping_customer");
          },
        ),
        title: const Text(
          'Detalle de compra',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: GlobalColors.primary,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Mostrar imagen del producto
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('$url$versionService$methodGetImages${controller.detailShoppingDto.productImagePath.toString()}',),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cliente: ${controller.detailShoppingDto.customerName}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Producto: ${controller.detailShoppingDto.productName}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Cantidad: ${controller.detailShoppingDto.amount} ${controller.detailShoppingDto.unitExtend}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Precio Total: S/ ${controller.detailShoppingDto.totalPrice}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: getStatusColor(
                                controller.detailShoppingDto.status),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(controller.detailShoppingDto.status.toUpperCase()),
                      ],
                    ),
                    const SizedBox(height: 16),
                    if (controller.detailShoppingDto.status == "activo")
                      ElevatedButton.icon(
                        onPressed: () => controller.saveImage(),
                        icon: const Icon(Icons.photo_library),
                        label: const Text('Cargar Comprobante'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: GlobalColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
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
