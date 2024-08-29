import 'package:app_pacharuna/app/controllers/homeproducer_controller.dart';
import 'package:app_pacharuna/app/ui/widgets/navigation_drawer.dart';
import 'package:app_pacharuna/app/utils/global_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeProducerPage extends GetView<HomeProducerController> {
  const HomeProducerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Mis productos',
            style: TextStyle(color: Colors.white),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: GlobalColors.primary,
        ),
        drawer: const NavigationDrawerLayout(),
        body: SafeArea(child: Text('HomeProducerController')));
  }
}
