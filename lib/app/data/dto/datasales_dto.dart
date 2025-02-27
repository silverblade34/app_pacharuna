// To parse this JSON data, do
//
//     final dataSalesDto = dataSalesDtoFromJson(jsonString);

import 'dart:convert';

DataSalesDto dataSalesDtoFromJson(String str) => DataSalesDto.fromJson(json.decode(str));

String dataSalesDtoToJson(DataSalesDto data) => json.encode(data.toJson());

class DataSalesDto {
    bool status;
    String message;
    List<DatumSales> data;

    DataSalesDto({
        required this.status,
        required this.message,
        required this.data,
    });

    factory DataSalesDto.fromJson(Map<String, dynamic> json) => DataSalesDto(
        status: json["status"],
        message: json["message"],
        data: List<DatumSales>.from(json["data"].map((x) => DatumSales.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class DatumSales {
    int saleId;
    int customerId;
    String amount;
    String totalPrice;
    String unitPrice;
    String igv;
    String status;
    String subtotal;
    Vouchers vouchers;
    Product product;
    Customer customer;
    Unit unit;

    DatumSales({
        required this.saleId,
        required this.customerId,
        required this.amount,
        required this.totalPrice,
        required this.unitPrice,
        required this.igv,
        required this.status,
        required this.subtotal,
        required this.vouchers,
        required this.product,
        required this.customer,
        required this.unit,
    });

    factory DatumSales.fromJson(Map<String, dynamic> json) => DatumSales(
        saleId: json["saleId"],
        customerId: json["customer_id"],
        amount: json["amount"],
        totalPrice: json["totalPrice"],
        unitPrice: json["unitPrice"],
        igv: json["igv"],
        status: json["status"],
        subtotal: json["subtotal"],
        vouchers: Vouchers.fromJson(json["vouchers"]),
        product: Product.fromJson(json["product"]),
        customer: Customer.fromJson(json["customer"]),
        unit: Unit.fromJson(json["unit"]),
    );

    Map<String, dynamic> toJson() => {
        "saleId": saleId,
        "customer_id": customerId,
        "amount": amount,
        "totalPrice": totalPrice,
        "unitPrice": unitPrice,
        "igv": igv,
        "status": status,
        "subtotal": subtotal,
        "vouchers": vouchers.toJson(),
        "product": product.toJson(),
        "customer": customer.toJson(),
        "unit": unit.toJson(),
    };
}

class Customer {
    int id;
    String firstName;
    String lastName;
    String bussinesName;
    String phone;
    String document;

    Customer({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.bussinesName,
        required this.phone,
        required this.document,
    });

    factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        bussinesName: json["bussinesName"],
        phone: json["phone"],
        document: json["document"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "bussinesName": bussinesName,
        "phone": phone,
        "document": document,
    };
}

class Product {
    int id;
    String name;
    String description;
    int categoryId;
    String price;
    int stock;
    String unitExtent;
    List<String> images;
    Producer producer;

    Product({
        required this.id,
        required this.name,
        required this.description,
        required this.categoryId,
        required this.price,
        required this.stock,
        required this.unitExtent,
        required this.images,
        required this.producer,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        categoryId: json["category_id"],
        price: json["price"],
        stock: json["stock"],
        unitExtent: json["unitExtent"],
        images: List<String>.from(json["images"].map((x) => x)),
        producer: Producer.fromJson(json["producer"]),
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
        "producer": producer.toJson(),
    };
}

class Producer {
    int id;
    String name;
    String bussinesName;
    String phone;
    String document;

    Producer({
        required this.id,
        required this.name,
        required this.bussinesName,
        required this.phone,
        required this.document,
    });

    factory Producer.fromJson(Map<String, dynamic> json) => Producer(
        id: json["id"],
        name: json["name"],
        bussinesName: json["bussinesName"],
        phone: json["phone"],
        document: json["document"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "bussinesName": bussinesName,
        "phone": phone,
        "document": document,
    };
}

class Unit {
    int id;
    String name;

    Unit({
        required this.id,
        required this.name,
    });

    factory Unit.fromJson(Map<String, dynamic> json) => Unit(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

class Vouchers {
    List<dynamic> comprobante;
    List<dynamic> pay;

    Vouchers({
        required this.comprobante,
        required this.pay,
    });

    factory Vouchers.fromJson(Map<String, dynamic> json) => Vouchers(
        comprobante: List<dynamic>.from(json["COMPROBANTE"].map((x) => x)),
        pay: List<dynamic>.from(json["PAY"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "COMPROBANTE": List<dynamic>.from(comprobante.map((x) => x)),
        "PAY": List<dynamic>.from(pay.map((x) => x)),
    };
}
