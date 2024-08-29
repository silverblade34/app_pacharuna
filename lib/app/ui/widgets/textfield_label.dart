import 'package:flutter/material.dart';

class TextFieldLabel extends StatelessWidget {
  final String label;
  final String hinText;
  final Icon icon;
  final TextEditingController controller;

  const TextFieldLabel(
      {super.key,
      required this.label,
      required this.hinText,
      required this.icon,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(
          height: 10,
        ),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: icon,
            hintText: hinText,
            filled: true,
            fillColor: Colors.white,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
