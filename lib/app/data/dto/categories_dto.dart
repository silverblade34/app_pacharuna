// To parse this JSON data, do
//
//     final categoriesDto = categoriesDtoFromJson(jsonString);

import 'dart:convert';

CategoriesDto categoriesDtoFromJson(String str) =>
    CategoriesDto.fromJson(json.decode(str));

String categoriesDtoToJson(CategoriesDto data) => json.encode(data.toJson());

class CategoriesDto {
  bool status;
  String message;
  List<DatumCategory> data;

  CategoriesDto({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CategoriesDto.fromJson(Map<String, dynamic> json) => CategoriesDto(
        status: json["status"],
        message: json["message"],
        data: List<DatumCategory>.from(
            json["data"].map((x) => DatumCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DatumCategory {
  int id;
  String name;

  DatumCategory({
    required this.id,
    required this.name,
  });

  factory DatumCategory.fromJson(Map<String, dynamic> json) => DatumCategory(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
