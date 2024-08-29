import 'package:app_pacharuna/app/data/dto/products_dto.dart';
import 'package:app_pacharuna/app/utils/global_colors.dart';
import 'package:app_pacharuna/app/utils/global_utils.dart';
import 'package:flutter/material.dart';

class CardProduct extends StatelessWidget {
  final DatumProduct datumProduct;
  final VoidCallback onPressed;

  const CardProduct({
    super.key,
    required this.datumProduct,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: datumProduct.images.isNotEmpty
                  ? Image.network(
                      '$url$versionService$methodGetImages${datumProduct.images[0]}',
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      'assets/images/cosecha3.jpg',
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  datumProduct.name, // Nombre del producto
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'S/ ${datumProduct.price}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: GlobalColors.terciary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child:  Text('Ver detalles', style: TextStyle(color: GlobalColors.terciaryLight)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
