import 'package:app_pacharuna/app/controllers/shoppingcustomer_controller.dart';
import 'package:app_pacharuna/app/data/dto/datasales_dto.dart';
import 'package:app_pacharuna/app/ui/widgets/navigation_drawer.dart';
import 'package:app_pacharuna/app/utils/global_colors.dart';
import 'package:app_pacharuna/app/utils/global_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppingCustomerPage extends GetView<ShoppingCustomerController> {
  const ShoppingCustomerPage({super.key});

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
        title: const Text(
          'Compras',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: GlobalColors.primary,
      ),
      drawer: const NavigationDrawerLayout(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Obx(() {
            return ListView.builder(
              itemCount: controller.shoppingItems.length,
              itemBuilder: (context, index) {
                DatumSales item = controller.shoppingItems[index];
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: Image.network(
                      '$url$versionService$methodGetImages${item.productImagePath.toString()}',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(item.productName),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                color: getStatusColor(item.status),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              item.status.toUpperCase(),
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        Text('Precio total: S/ ${item.totalPrice}'),
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('S/ ${item.unitPrice}'),
                        Text('${item.amount} ${item.unitExtend}'),
                      ],
                    ),
                    onTap: () {
                      Get.offAllNamed("/shopping_detail_customer", arguments: item);
                    },
                  ),
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
