import 'package:app_pacharuna/app/data/models/menuoptions_model.dart';
import 'package:app_pacharuna/app/utils/global_colors.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerBodyWidget extends StatelessWidget {
  const DrawerBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    double screenHeight = MediaQuery.of(context).size.height;
    dynamic storedData = box.read("menuOptions");
    String? selectedRoute = box.read("selectedRoute");
    List<MenuOptionsModel> menuOptions = [];

    if (storedData is List<MenuOptionsModel>) {
      menuOptions = storedData;
    } else {
      menuOptions = storedData
          .map<MenuOptionsModel>((item) => MenuOptionsModel(
                title: item['title'],
                route: item['route'],
              ))
          .toList();
    }
    
    return Container(
      height: screenHeight - 110,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(
            menuOptions.length,
            (index) {
              final isLastItem = index == menuOptions.length - 1;
              final isSelected = menuOptions[index].route == selectedRoute;

              return Container(
                decoration: BoxDecoration(
                  color: isSelected ? const Color.fromARGB(255, 233, 233, 233) : Colors.transparent,
                  border: Border(
                    bottom: isLastItem
                        ? BorderSide.none
                        : BorderSide(color: Colors.grey.shade300, width: 1),
                  ),
                ),
                child: ListTile(
                  title: Text(
                    menuOptions[index].title,
                    style: TextStyle(
                      fontSize: 16,
                      color: isSelected ? GlobalColors.primary : Colors.black,
                    ),
                  ),
                  onTap: () {
                    box.write("selectedRoute", menuOptions[index].route);
                    Navigator.pop(context);
                    if (menuOptions[index].route == "/logout") {
                      Get.dialog(
                        AlertDialog(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          backgroundColor: Colors.white,
                          title: const Text(
                            'Cerrar sesión',
                            style: TextStyle(fontSize: 21),
                          ),
                          content: Text(
                            '¿Desea salir de la aplicación?',
                            style: TextStyle(
                              fontSize: 16,
                              color: GlobalColors.greyHard,
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Get.back(); // Cerrar el modal
                              },
                              child: const Text('NO'),
                            ),
                            TextButton(
                              onPressed: () {
                                EasyLoading.show(status: 'Cargando...');
                                Get.back(); // Cerrar el modal
                                GetStorage().erase();
                                EasyLoading.dismiss();
                                Get.offAllNamed('/login');
                              },
                              child: const Text('SI'),
                            ),
                          ],
                        ),
                      );
                    } else {
                      Get.offAllNamed(menuOptions[index].route);
                    }
                  },
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
