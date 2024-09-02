// To parse this JSON data, do
//
//     final dataSalesDto = dataSalesDtoFromJson(jsonString);

import 'dart:convert';

DataSalesDto dataSalesDtoFromJson(String str) =>
    DataSalesDto.fromJson(json.decode(str));

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
        data: List<DatumSales>.from(
            json["data"].map((x) => DatumSales.fromJson(x))),
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
  String customerName;
  String productName;
  String totalPrice;
  String unitExtend;
  int productId;
  String unitPrice;
  String igv;
  String status;
  String subtotal;
  String productImagePath;
  String producerName;
  Vouchers vouchers;

  DatumSales({
    required this.saleId,
    required this.customerId,
    required this.amount,
    required this.customerName,
    required this.productName,
    required this.totalPrice,
    required this.productId,
    required this.unitPrice,
    required this.unitExtend,
    required this.igv,
    required this.status,
    required this.subtotal,
    required this.productImagePath,
    required this.producerName,
    required this.vouchers,
  });

  factory DatumSales.fromJson(Map<String, dynamic> json) => DatumSales(
        saleId: json["saleId"],
        customerId: json["customer_id"],
        amount: json["amount"],
        customerName: json["customerName"],
        productName: json["productName"],
        totalPrice: json["totalPrice"],
        productId: json["product_id"],
        unitPrice: json["unitPrice"],
        unitExtend: json["unitExtend"],
        igv: json["igv"],
        status: json["status"],
        subtotal: json["subtotal"],
        productImagePath: json["productImagePath"],
        producerName: json["producerName"],
        vouchers: Vouchers.fromJson(json["vouchers"]),
      );

  Map<String, dynamic> toJson() => {
        "saleId": saleId,
        "customer_id": customerId,
        "amount": amount,
        "customerName": customerName,
        "productName": productName,
        "totalPrice": totalPrice,
        "product_id": productId,
        "unitPrice": unitPrice,
        "unitExtend": unitExtend,
        "igv": igv,
        "status": status,
        "subtotal": subtotal,
        "productImagePath": productImagePath,
        "producerName": producerName,
        "vouchers": vouchers.toJson(),
      };
}

class Vouchers {
  List<String> comprobante;
  List<dynamic> pay;

  Vouchers({
    required this.comprobante,
    required this.pay,
  });

  factory Vouchers.fromJson(Map<String, dynamic> json) => Vouchers(
        comprobante: List<String>.from(json["COMPROBANTE"].map((x) => x)),
        pay: List<dynamic>.from(json["PAY"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "COMPROBANTE": List<dynamic>.from(comprobante.map((x) => x)),
        "PAY": List<dynamic>.from(pay.map((x) => x)),
      };
}
