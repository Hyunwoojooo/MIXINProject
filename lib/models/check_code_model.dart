// To parse this JSON data, do
//
//     final checkCodeModel = checkCodeModelFromJson(jsonString);

import 'dart:convert';

CheckCodeModel checkCodeModelFromJson(String str) =>
    CheckCodeModel.fromJson(json.decode(str));

String checkCodeModelToJson(CheckCodeModel data) => json.encode(data.toJson());

class CheckCodeModel {
  int code;
  String message;
  dynamic data;

  CheckCodeModel({
    required this.code,
    required this.message,
    this.data,
  });

  factory CheckCodeModel.fromJson(Map<String, dynamic> json) => CheckCodeModel(
        code: json["code"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data,
      };
}
