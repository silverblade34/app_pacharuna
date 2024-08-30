import 'package:flutter/material.dart';

Widget buildProductDescription(String description) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text("Descripción",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      const SizedBox(height: 8),
      Text(
        description,
        style: const TextStyle(fontSize: 16),
      ),
      const SizedBox(height: 16),
    ],
  );
}
