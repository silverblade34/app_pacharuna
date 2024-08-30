// To parse this JSON data, do
//
//     final productDetailDto = productDetailDtoFromJson(jsonString);

import 'dart:convert';

ProductDetailDto productDetailDtoFromJson(String str) => ProductDetailDto.fromJson(json.decode(str));

String productDetailDtoToJson(ProductDetailDto data) => json.encode(data.toJson());

class ProductDetailDto {
    bool status;
    String message;
    DataProductDetail data;

    ProductDetailDto({
        required this.status,
        required this.message,
        required this.data,
    });

    factory ProductDetailDto.fromJson(Map<String, dynamic> json) => ProductDetailDto(
        status: json["status"],
        message: json["message"],
        data: DataProductDetail.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
    };
}

class DataProductDetail {
    int productId;
    String name;
    String description;
    int categoryId;
    String price;
    int stock;
    String unitExtent;
    Producer producer;

    DataProductDetail({
        required this.productId,
        required this.name,
        required this.description,
        required this.categoryId,
        required this.price,
        required this.stock,
        required this.unitExtent,
        required this.producer,
    });

    factory DataProductDetail.fromJson(Map<String, dynamic> json) => DataProductDetail(
        productId: json["productId"],
        name: json["name"],
        description: json["description"],
        categoryId: json["category_id"],
        price: json["price"],
        stock: json["stock"],
        unitExtent: json["unitExtent"],
        producer: Producer.fromJson(json["producer"]),
    );

    Map<String, dynamic> toJson() => {
        "productId": productId,
        "name": name,
        "description": description,
        "category_id": categoryId,
        "price": price,
        "stock": stock,
        "unitExtent": unitExtent,
        "producer": producer.toJson(),
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
