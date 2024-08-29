// To parse this JSON data, do
//
//     final menuOptionsModel = menuOptionsModelFromJson(jsonString);

import 'dart:convert';

MenuOptionsModel menuOptionsModelFromJson(String str) => MenuOptionsModel.fromJson(json.decode(str));

String menuOptionsModelToJson(MenuOptionsModel data) => json.encode(data.toJson());

class MenuOptionsModel {
    String title;
    String route;

    MenuOptionsModel({
        required this.title,
        required this.route,
    });

    factory MenuOptionsModel.fromJson(Map<String, dynamic> json) => MenuOptionsModel(
        title: json["title"],
        route: json["route"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "route": route,
    };
}