import 'package:app_pacharuna/app/utils/global_utils.dart';
import 'package:flutter/material.dart';

Widget buildImageCarousel(List<String> imageUrls) {
  return SizedBox(
    height: 250,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: imageUrls.length,
      itemBuilder: (context, index) {
        return buildProductImage(
            '$url$versionService$methodGetImages${imageUrls[index]}');
      },
    ),
  );
}

Widget buildProductImage(String imageUrl) {
  return Container(
    margin: const EdgeInsets.only(right: 8),
    width: 200,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      image: DecorationImage(
        image: NetworkImage(imageUrl),
        fit: BoxFit.cover,
      ),
    ),
  );
}
