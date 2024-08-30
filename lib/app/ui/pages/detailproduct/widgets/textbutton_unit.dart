import 'package:app_pacharuna/app/controllers/detailproduct_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextButtonUnit extends StatelessWidget {
  final DetailProductController controller;
  final String typeUnit;

  const TextButtonUnit(
      {super.key, required this.controller, required this.typeUnit});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextButton(
        onPressed: () {
          controller.selectButton(typeUnit);
        },
        style: TextButton.styleFrom(
          backgroundColor: controller.selectedButton.value == typeUnit
              ? const Color.fromARGB(255, 118, 175, 221)
              : const Color.fromARGB(255, 233, 233, 233),
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
        ),
        child: Text(
          typeUnit,
          style: TextStyle(
            color: controller.selectedButton.value == typeUnit
                ? Colors.white
                : const Color.fromARGB(255, 66, 66, 66),
          ),
        ),
      ),
    );
  }
}
