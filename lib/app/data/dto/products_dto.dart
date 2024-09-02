// To parse this JSON data, do
//
//     final productsDto = productsDtoFromJson(jsonString);

import 'dart:convert';

ProductsDto productsDtoFromJson(String str) =>
    ProductsDto.fromJson(json.decode(str));

String productsDtoToJson(ProductsDto data) => json.encode(data.toJson());

class ProductsDto {
  bool status;
  String message;
  List<DatumProduct> data;

  ProductsDto({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ProductsDto.fromJson(Map<String, dynamic> json) => ProductsDto(
        status: json["status"],
        message: json["message"],
        data: List<DatumProduct>.from(
            json["data"].map((x) => DatumProduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DatumProduct {
  int productId;
  String name;
  String description;
  int categoryId;
  String price;
  int stock;
  String unitExtent;
  int unitExtentId;
  Producer producer;
  List<String> images;

  DatumProduct({
    required this.productId,
    required this.name,
    required this.description,
    required this.categoryId,
    required this.price,
    required this.stock,
    required this.unitExtentId,
    required this.unitExtent,
    required this.producer,
    required this.images,
  });

  factory DatumProduct.fromJson(Map<String, dynamic> json) => DatumProduct(
        productId: json["productId"],
        name: json["name"],
        description: json["description"],
        categoryId: json["category_id"],
        price: json["price"],
        stock: json["stock"],
        unitExtent: json["unitExtent"],
        unitExtentId: json["unitExtentId"],
        producer: Producer.fromJson(json["producer"]),
        images: List<String>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "name": name,
        "description": description,
        "category_id": categoryId,
        "price": price,
        "stock": stock,
        "unitExtent": unitExtent,
        "unitExtentId": unitExtentId,
        "producer": producer.toJson(),
        "images": List<dynamic>.from(images.map((x) => x)),
      };
}

class Producer {
  String bussinesName;
  String phone;

  Producer({
    required this.bussinesName,
    required this.phone,
  });

  factory Producer.fromJson(Map<String, dynamic> json) => Producer(
        bussinesName: json["bussinesName"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "bussinesName": bussinesName,
        "phone": phone,
      };
}
