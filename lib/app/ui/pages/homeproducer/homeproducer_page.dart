import 'package:app_pacharuna/app/controllers/homeproducer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeProducerPage extends GetView<HomeProducerController> {
  const HomeProducerPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(title: Text('HomeProducerPage')),

    body: SafeArea(
      child: Text('HomeProducerController'))
    );
  }
}