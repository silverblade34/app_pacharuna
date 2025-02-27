import 'dart:io';
import 'package:app_pacharuna/app/data/dto/datasales_dto.dart';
import 'package:app_pacharuna/app/data/repositories/shoppingdetailcustomer_repository.dart';
import 'package:app_pacharuna/app/data/repositories/shoppingdetailproducer_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ShoppingdetailproducerController extends GetxController {
  DatumSales detailShoppingDto = Get.arguments;
  ShoppingdetailproducerRepository shoppingdetailproducerRepository =
      ShoppingdetailproducerRepository();
  ShoppingdetailcustomerRepository shoppingdetailcustomerRepository =
      ShoppingdetailcustomerRepository();
  var imagesComprobante = <File>[].obs;

  saveImage() async {}

  Future<void> addImage() async {
    if (await _pedirPermisoGaleria()) {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        imagesComprobante.add(File(image.path));
      }
    } else {
      EasyLoading.showInfo("Debe otorgar permisos para la cámara");
    }
  }

  Future<bool> _pedirPermisoGaleria() async {
    PermissionStatus storagePermission = await Permission.storage.request();
    PermissionStatus photosPermission = await Permission.photos.request();

    return storagePermission == PermissionStatus.granted ||
        photosPermission == PermissionStatus.granted;
  }

  void removeImage(int index) {
    imagesComprobante.removeAt(index);
  }

  void updateShopping() async {
    if (imagesComprobante.isNotEmpty) {
      try {
        EasyLoading.show(status: "Guardando...");

        await shoppingdetailcustomerRepository.updatePaySaleProducer(
            detailShoppingDto.saleId, imagesComprobante);

        EasyLoading.showSuccess("Se ha actualizado correctamente la venta");
        Future.delayed(const Duration(seconds: 1), () {
          Get.offAllNamed("/shopping_producer");
        });
      } catch (e) {
        EasyLoading.showInfo(e.toString());
      }
    } else {
      EasyLoading.showInfo("Debe cargar al menos un comprobante de pago");
    }
  }

  rejectPurchase(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirmación"),
          content:
              const Text("¿Estás seguro de rechazar esta solcitud de compra?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
              },
              child: const Text("Cancelar"),
            ),
            TextButton(
              onPressed: () async {
                EasyLoading.show(status: "Cagando...");
                try {
                  await shoppingdetailproducerRepository
                      .deleteSale(detailShoppingDto.saleId);
                  EasyLoading.dismiss();
                  Get.offAllNamed("/shopping_producer");
                } catch (e) {
                  EasyLoading.showError(e.toString());
                }
              },
              child: const Text("Rechazar"),
            ),
          ],
        );
      },
    );
  }

  activePurchase(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirmación"),
          content:
              const Text("¿Estás seguro de activar esta solicitud de compra?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancelar"),
            ),
            TextButton(
              onPressed: () async {
                EasyLoading.show(status: "Cagando...");
                try {
                  await shoppingdetailproducerRepository.activateSale(
                      detailShoppingDto.saleId, 'activo');
                  EasyLoading.dismiss();
                  Get.offAllNamed("/shopping_producer");
                } catch (e) {
                  EasyLoading.showError(e.toString());
                }
              },
              child: const Text("Activar"),
            ),
          ],
        );
      },
    );
  }

  approvePurchase(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirmación"),
          content:
              const Text("¿Estás seguro de aprobar esta solicitud de compra?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancelar"),
            ),
            TextButton(
              onPressed: () async {
                EasyLoading.show(status: "Cagando...");
                try {
                  await shoppingdetailproducerRepository.activateSale(
                      detailShoppingDto.saleId, 'aprobado');
                  EasyLoading.dismiss();
                  Get.offAllNamed("/shopping_producer");
                } catch (e) {
                  EasyLoading.showError(e.toString());
                }
              },
              child: const Text("Aprobar"),
            ),
          ],
        );
      },
    );
  }
}
