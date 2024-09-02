import 'package:app_pacharuna/app/data/dto/datasales_dto.dart';
import 'package:app_pacharuna/app/data/repositories/shoppingcustomer_repository.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ShoppingCustomerController extends GetxController {
  var shoppingItems = <DatumSales>[].obs;
  ShoppingCustomerRepository shoppingCustomerRepository =
      ShoppingCustomerRepository();

  @override
  void onInit() async {
    super.onInit();
    EasyLoading.show(status: "Cargando...");
    await getSales();
    EasyLoading.dismiss();
  }

  getSales() async {
    try {
      final validate = await shoppingCustomerRepository.findAllSales();
      shoppingItems.value = validate.data;
    } catch (e) {
      EasyLoading.showInfo(e.toString());
    }
  }
}
