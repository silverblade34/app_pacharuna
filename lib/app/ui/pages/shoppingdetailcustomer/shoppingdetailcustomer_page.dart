import 'package:app_pacharuna/app/controllers/shoppingdetailcustomer_controller.dart';
import 'package:app_pacharuna/app/utils/global_colors.dart';
import 'package:app_pacharuna/app/utils/global_utils.dart';
import 'package:dotted_border/dotted_border.dart';
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
                    image: NetworkImage(
                      '$url$versionService$methodGetImages${controller.detailShoppingDto.productImagePath.toString()}',
                    ),
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
                      'Productor: ${controller.detailShoppingDto.producerName}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Producto: ${controller.detailShoppingDto.productName}',
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
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Precio unitario:',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'S/ ${controller.detailShoppingDto.unitPrice} - ${controller.detailShoppingDto.unitExtend}',
                          style: const TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Cantidad:',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          '${controller.detailShoppingDto.amount} ${controller.detailShoppingDto.unitExtend}',
                          style: const TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'IGV:',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'S/ ${(double.parse(controller.detailShoppingDto.igv).toStringAsFixed(2))}',
                          style: const TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Precio Total:',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'S/ ${controller.detailShoppingDto.totalPrice}',
                          style: const TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    if (controller.detailShoppingDto.status == "activo") ...[
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Comprobantes de pago",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              if (controller
                                  .detailShoppingDto.vouchers.pay.isEmpty) ...[
                                IconButton(
                                  onPressed: controller.addImage,
                                  icon: const Icon(Icons.add_a_photo),
                                  color: GlobalColors.secondary,
                                ),
                              ] else ...[
                                Icon(
                                  Icons.image_outlined,
                                  color: GlobalColors.secondary,
                                )
                              ]
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          if (controller
                              .detailShoppingDto.vouchers.pay.isNotEmpty) ...[
                            Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: controller
                                  .detailShoppingDto.vouchers.pay
                                  .map((image) {
                                return Stack(
                                  children: [
                                    Image.network(
                                      '$url$versionService$methodGetImages$image',
                                      width: 120,
                                      height: 120,
                                      fit: BoxFit.cover,
                                    ),
                                  ],
                                );
                              }).toList(),
                            )
                          ] else ...[
                            Obx(() {
                              if (controller.imagesPay.isEmpty) {
                                return GestureDetector(
                                  child: DottedBorder(
                                    color:
                                        const Color.fromARGB(255, 59, 59, 59),
                                    strokeWidth: 1,
                                    radius: const Radius.circular(40),
                                    child: SizedBox(
                                      width: double.infinity,
                                      height: 100,
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/images/folders.png',
                                              width: 40,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Cargar comprobantes",
                                              style: TextStyle(
                                                  color: GlobalColors.greyHard,
                                                  fontSize: 15),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    controller.addImage();
                                  },
                                );
                              } else {
                                return Wrap(
                                  spacing: 10,
                                  runSpacing: 10,
                                  children: controller.imagesPay.map((image) {
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
                                              padding: WidgetStatePropertyAll(
                                                  EdgeInsets.all(3)),
                                              backgroundColor:
                                                  WidgetStatePropertyAll(
                                                      Colors.red),
                                            ),
                                            onPressed: () =>
                                                controller.removeImage(
                                                    controller.imagesPay
                                                        .indexOf(image)),
                                          ),
                                        ),
                                      ],
                                    );
                                  }).toList(),
                                );
                              }
                            })
                          ]
                        ],
                      )
                    ],
                    const SizedBox(
                      height: 10,
                    ),
                    if (controller.detailShoppingDto.status == "culminado") ...[
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Boleta de compra",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              IconButton(
                                onPressed: () => controller.saveImage(),
                                icon: const Icon(Icons.photo_library),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Image.network(
                            '$url$versionService$methodGetImages${controller.detailShoppingDto.vouchers.comprobante[0]}',
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ],
                    const SizedBox(
                      height: 10,
                    ),
                    if (controller.detailShoppingDto.status == "activo") ...[
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            controller.updateShopping();
                          },
                          style: ButtonStyle(
                            padding:
                                const WidgetStatePropertyAll(EdgeInsets.all(5)),
                            backgroundColor:
                                WidgetStatePropertyAll(GlobalColors.terciary),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          child: const Text(
                            "Actualizar compra",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ]
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
