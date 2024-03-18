// To parse this JSON data, do
//
//     final productListModel = productListModelFromJson(jsonString);

import 'dart:convert';

List<ProductListModel> productListModelFromJson(String str) => List<ProductListModel>.from(json.decode(str).map((x) => ProductListModel.fromJson(x)));

String productListModelToJson(List<ProductListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductListModel {
    int userId;
    int id;
    String title;
    String body;

    ProductListModel({
        required this.userId,
        required this.id,
        required this.title,
        required this.body,
    });

    factory ProductListModel.fromJson(Map<String, dynamic> json) => ProductListModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
