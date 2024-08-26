import 'package:app_pacharuna/app/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomecustomerController extends GetxController {
  RxString valueCategoryDropdown = RxString('0');
  TextEditingController searchProduct = TextEditingController();

  RxList<DropdownMenuItem<String>> itemsCategories =
      RxList<DropdownMenuItem<String>>(
    [
      const DropdownMenuItem(
        value: "0",
        child: Text(
          "SELECCIONAR",
          textAlign: TextAlign.center,
        ),
      ),
      const DropdownMenuItem(
        value: "FRUTA",
        child: Text(
          "FRUTAS",
          textAlign: TextAlign.center,
        ),
      ),
      const DropdownMenuItem(
        value: "VERDURAS",
        child: Text(
          "VERDURAS",
          textAlign: TextAlign.center,
        ),
      ),
    ],
  );

  // Lista estática de productos
  RxList<Product> products = RxList<Product>([
    Product(
      name: 'Manzana Roja',
      price: 2.50,
      imageUrl: 'https://www.bupasalud.com/sites/default/files/styles/640_x_400/public/articulos/2023-04/fotos/apple-field.webp?itok=ahpiJ5ZR',
    ),
    Product(
      name: 'Plátano',
      price: 1.20,
      imageUrl: 'https://imagenes.eltiempo.com/files/image_1200_600/uploads/2022/11/20/637ab0fcb389b.jpeg',
    ),
    Product(
      name: 'Zanahoria',
      price: 1.00,
      imageUrl: 'https://content.cuerpomente.com/medio/2024/04/26/zanahoria_9dec124a_1291840035_240426230436_900x900.jpg',
    ),
    Product(
      name: 'Tomate',
      price: 1.50,
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTj5pn-0RFUjvugrBo-Q2BcXrNK0HHnE6pthw&s',
    ),
    Product(
      name: 'Naranja',
      price: 1.80,
      imageUrl: 'https://www.lavanguardia.com/files/og_thumbnail/files/fp/uploads/2022/06/26/62b85245d0ebb.r_d.240-320-24948.jpeg',
    ),
    Product(
      name: 'Lechuga',
      price: 0.90,
      imageUrl: 'https://proain.com/cdn/shop/articles/El_manejo_del_riego_en_la_produccion_de_lechuga.png?v=1601328335',
    ),
  ]);
}
