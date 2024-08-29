// To parse this JSON data, do
//
//     final productsDto = productsDtoFromJson(jsonString);

import 'dart:convert';

ProductsDto productsDtoFromJson(String str) => ProductsDto.fromJson(json.decode(str));

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
        data: List<DatumProduct>.from(json["data"].map((x) => DatumProduct.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class DatumProduct {
    int id;
    String name;
    String description;
    int categoryId;
    String price;
    int stock;
    String unitExtent;
    int producerId;
    List<String> images;

    DatumProduct({
        required this.id,
        required this.name,
        required this.description,
        required this.categoryId,
        required this.price,
        required this.stock,
        required this.unitExtent,
        required this.producerId,
        required this.images,
    });

    factory DatumProduct.fromJson(Map<String, dynamic> json) => DatumProduct(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        categoryId: json["category_id"],
        price: json["price"],
        stock: json["stock"],
        unitExtent: json["unitExtent"],
        producerId: json["producer_id"],
        images: List<String>.from(json["images"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "category_id": categoryId,
        "price": price,
        "stock": stock,
        "unitExtent": unitExtent,
        "producer_id": producerId,
        "images": List<dynamic>.from(images.map((x) => x)),
    };
}
