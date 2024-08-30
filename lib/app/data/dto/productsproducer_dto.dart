// To parse this JSON data, do
//
//     final productsProducerDto = productsProducerDtoFromJson(jsonString);

import 'dart:convert';

ProductsProducerDto productsProducerDtoFromJson(String str) => ProductsProducerDto.fromJson(json.decode(str));

String productsProducerDtoToJson(ProductsProducerDto data) => json.encode(data.toJson());

class ProductsProducerDto {
    bool status;
    String message;
    List<DatumProductProducer> data;

    ProductsProducerDto({
        required this.status,
        required this.message,
        required this.data,
    });

    factory ProductsProducerDto.fromJson(Map<String, dynamic> json) => ProductsProducerDto(
        status: json["status"],
        message: json["message"],
        data: List<DatumProductProducer>.from(json["data"].map((x) => DatumProductProducer.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class DatumProductProducer {
    int id;
    String name;
    String description;
    int categoryId;
    String price;
    int stock;
    String unitExtent;
    List<String> images;

    DatumProductProducer({
        required this.id,
        required this.name,
        required this.description,
        required this.categoryId,
        required this.price,
        required this.stock,
        required this.unitExtent,
        required this.images,
    });

    factory DatumProductProducer.fromJson(Map<String, dynamic> json) => DatumProductProducer(
        id: json["productId"],
        name: json["name"],
        description: json["description"],
        categoryId: json["category_id"],
        price: json["price"],
        stock: json["stock"],
        unitExtent: json["unitExtent"],
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
        "images": List<dynamic>.from(images.map((x) => x)),
    };
}
