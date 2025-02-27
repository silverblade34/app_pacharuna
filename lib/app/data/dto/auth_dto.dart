// To parse this JSON data, do
//
//     final authDto = authDtoFromJson(jsonString);

import 'dart:convert';

AuthDto authDtoFromJson(String str) => AuthDto.fromJson(json.decode(str));

String authDtoToJson(AuthDto data) => json.encode(data.toJson());

class AuthDto {
  bool status;
  String message;
  DataAuth data;

  AuthDto({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AuthDto.fromJson(Map<String, dynamic> json) => AuthDto(
        status: json["status"],
        message: json["message"],
        data: DataAuth.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class DataAuth {
  int userId;
  String username;
  String role;
  String direction;
  String token;

  DataAuth({
    required this.userId,
    required this.username,
    required this.role,
    required this.direction,
    required this.token,
  });

  factory DataAuth.fromJson(Map<String, dynamic> json) => DataAuth(
        userId: json["userId"],
        username: json["username"],
        direction: json["direction"],
        role: json["role"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "username": username,
        "direction": direction,
        "role": role,
        "token": token,
      };
}
