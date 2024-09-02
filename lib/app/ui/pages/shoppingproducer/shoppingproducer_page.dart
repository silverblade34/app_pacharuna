import 'package:app_pacharuna/app/controllers/shoppingproducer_controller.dart';
import 'package:app_pacharuna/app/ui/widgets/navigation_drawer.dart';
import 'package:app_pacharuna/app/utils/global_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppingproducerPage extends GetView<ShoppingproducerController> {
  const ShoppingproducerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Ventas',
            style: TextStyle(color: Colors.white),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: GlobalColors.primary,
        ),
        drawer: const NavigationDrawerLayout(),
        body: SafeArea(child: Text('ShoppingproducerPageController')));
  }
}
