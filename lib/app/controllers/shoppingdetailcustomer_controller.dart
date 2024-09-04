import 'package:app_pacharuna/app/data/dto/datasales_dto.dart';
import 'package:app_pacharuna/app/data/repositories/shoppingdetailcustomer_repository.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ShoppingDetailCustomerController extends GetxController {
  ShoppingdetailcustomerRepository shoppingdetailcustomerRepository =
      ShoppingdetailcustomerRepository();
  DatumSales detailShoppingDto = Get.arguments;
  var imagesPay = <File>[].obs;

  saveImage() async {}

  Future<void> addImage() async {
    if (await _pedirPermisoGaleria()) {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        imagesPay.add(File(image.path));
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
    imagesPay.removeAt(index);
  }

  void updateShopping() async {
    if (detailShoppingDto.status == "activo") {
      if (imagesPay.isNotEmpty) {
        try {
          EasyLoading.show(status: "Guardando...");

          await shoppingdetailcustomerRepository.updatePaySale(
              detailShoppingDto.saleId, imagesPay);

          EasyLoading.showSuccess("Se ha actualizado correctamente la compra");
          Future.delayed(const Duration(seconds: 1), () {
            Get.offAllNamed("/shopping_customer");
          });
        } catch (e) {
          EasyLoading.showInfo(e.toString());
        }
      } else {
        EasyLoading.showInfo("Debe cargar al menos un comprobante de pago");
      }
    }
  }
}
