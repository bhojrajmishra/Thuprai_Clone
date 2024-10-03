// To parse this JSON data, do
//
//     final addCartRequest = addCartRequestFromJson(jsonString);

import 'dart:convert';

List<CartRequestModel> addCartRequestFromJson(String str) =>
    List<CartRequestModel>.from(
        json.decode(str).map((x) => CartRequestModel.fromJson(x)));

String addCartRequestToJson(List<CartRequestModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartRequestModel {
  String? path;
  int? quantity;
  String? url;

  CartRequestModel({
    this.path,
    this.quantity,
    this.url,
  });

  factory CartRequestModel.fromJson(Map<String, dynamic> json) =>
      CartRequestModel(
        path: json["path"],
        quantity: json["quantity"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "path": path,
        "quantity": quantity,
        "url": url,
      };
}
