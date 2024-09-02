import 'package:app_pacharuna/app/controllers/shoppingdetailproducer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppingdetailproducerPage extends GetView<ShoppingdetailproducerController> {
  const ShoppingdetailproducerPage({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(title: Text('ShoppingdetailproducerPage')),

    body: SafeArea(
      child: Text('ShoppingdetailproducerPageController'))
    );
  }
}