// To parse this JSON data, do
//
//     final detailShoppingDto = detailShoppingDtoFromJson(jsonString);

import 'dart:convert';

DetailShoppingDto detailShoppingDtoFromJson(String str) => DetailShoppingDto.fromJson(json.decode(str));

String detailShoppingDtoToJson(DetailShoppingDto data) => json.encode(data.toJson());

class DetailShoppingDto {
    String customerName;
    String productName;
    double totalPrice;
    double unitPrice;
    int amount;
    String unitExtend;
    String image;
    String status;

    DetailShoppingDto({
        required this.customerName,
        required this.productName,
        required this.totalPrice,
        required this.unitPrice,
        required this.amount,
        required this.unitExtend,
        required this.image,
        required this.status,
    });

    factory DetailShoppingDto.fromJson(Map<String, dynamic> json) => DetailShoppingDto(
        customerName: json["customerName"],
        productName: json["productName"],
        totalPrice: json["totalPrice"],
        unitPrice: json["unitPrice"]?.toDouble(),
        amount: json["amount"],
        unitExtend: json["unitExtend"],
        image: json["image"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "customerName": customerName,
        "productName": productName,
        "totalPrice": totalPrice,
        "unitPrice": unitPrice,
        "amount": amount,
        "unitExtend": unitExtend,
        "image": image,
        "status": status,
    };
}
