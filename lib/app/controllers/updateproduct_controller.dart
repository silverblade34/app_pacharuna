import 'package:app_pacharuna/app/data/dto/categories_dto.dart';
import 'package:app_pacharuna/app/data/dto/productsproducer_dto.dart';
import 'package:app_pacharuna/app/data/models/imageitem_model.dart';
import 'package:app_pacharuna/app/data/repositories/general_repository.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProductController extends GetxController {
  DatumProductProducer product = Get.arguments;
  GeneralRepository generalRepository = GeneralRepository();
  RxList<DatumCategory> categories = RxList<DatumCategory>([]);

  var name = ''.obs;
  var description = ''.obs;
  var categoryId = 0.obs;
  var price = ''.obs;
  var stock = 0.obs;
  var unitExtent = ''.obs;
  var images = <ImageItemModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
    EasyLoading.show(status: "Cargando...");
    name.value = product.name;
    description.value = product.description;
    categoryId.value = product.categoryId;
    price.value = product.price;
    stock.value = product.stock;
    unitExtent.value = product.unitExtent;
    images.value = product.images
        .map((imagePath) => ImageItemModel(path: imagePath, type: "NETWORK"))
        .toList();
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
        images.add(ImageItemModel(path: image.path, type: "LOCALSTORAGE"));
      }
    } else {
      EasyLoading.showInfo("Debe otorgar permisos para la camara");
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

  void updateProduct() {
    // Lógica para actualizar el producto en la base de datos
    // ...
  }
}
