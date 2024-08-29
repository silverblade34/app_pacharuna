import 'package:app_pacharuna/app/bindings/login_binding.dart';
import 'package:app_pacharuna/app/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

void main() async {
  await GetStorage.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  WakelockPlus.enable();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.LOGIN,
      theme: ThemeData(
        fontFamily: 'Poppins',
        useMaterial3: true,
        colorSchemeSeed: Colors.teal,
      ),
      defaultTransition: Transition.fade,
      initialBinding: LoginBinding(),
      getPages: AppPages.pages,
      builder: (context, widget) {
        widget = EasyLoading.init()(context, widget);
        return widget;
      },
    ),
  );
}
