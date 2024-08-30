import 'dart:io';
import 'package:app_pacharuna/app/data/dto/categories_dto.dart';
import 'package:app_pacharuna/app/data/repositories/createproduct_repository.dart';
import 'package:app_pacharuna/app/data/repositories/general_repository.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreateProductController extends GetxController {
  GeneralRepository generalRepository = GeneralRepository();
  RxList<DatumCategory> categories = RxList<DatumCategory>([]);
  CreateProductRepository createProductRepository = CreateProductRepository();

  var name = ''.obs;
  var description = ''.obs;
  var categoryId = 0.obs;
  var price = ''.obs;
  var stock = 0.obs;
  var unitExtent = ''.obs;
  var images = <File>[].obs;

  @override
  void onInit() async {
    super.onInit();
    EasyLoading.show(status: "Cargando...");
    await getCategories();
    EasyLoading.dismiss();
  }

  getCategories() async {
    final validate = await generalRepository.getCategories();
    categories.value = validate.data;
  }

  Future<void> addImage() async {
    if (await _pedirPermisoGaleria()) {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        images.add(File(image.path));
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
    images.removeAt(index);
  }

  void createProduct() async {
    if (name.value != "" &&
        description.value != "" &&
        categoryId.value != 0 &&
        price.value != "" &&
        stock.value != 0 &&
        unitExtent.value != "" &&
        unitExtent.value != "SIN SELECCIONAR") {
      if (images.isNotEmpty) {
        EasyLoading.show(status: "Guardando...");
        Map<String, dynamic> dataProduct = {
          "name": name.value,
          "description": description.value,
          "category_id": categoryId.value,
          "price": price.value,
          "stock": stock.value,
          "unitExtent": unitExtent.value
        };
        await createProductRepository.createProduct(dataProduct, images);

        EasyLoading.showSuccess("Se ha creado correctamente el producto");
        Future.delayed(const Duration(seconds: 1), () {
          Get.offAllNamed("/home_customer");
        });
      } else {
        EasyLoading.showInfo("Debe cargar al menos una imagen");
      }
    } else {
      EasyLoading.showInfo("Debe rellenar todos los campos");
    }
  }
}
