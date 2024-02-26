// import 'package:flutter/foundation.dart';

class Productmodel {
  String? sId;
  String? admin;
  List<String>? productImage;
  String? productName;
  String? role;
  int? productPrice;
  bool? isDelete;
  int? iV;

  Productmodel(
      {this.sId,
      this.admin,
      this.productImage,
      this.productName,
      this.role,
      this.productPrice,
      this.isDelete,
      this.iV});

  factory Productmodel.fromJson(Map<String, dynamic> json) {
    return Productmodel(
      sId: json['_id'],
      admin: json['admin'],
      productImage: json['productImage'].cast<String>(),
      productName: json['productName'],
      role: json['role'],
      productPrice: json['productPrice'],
      isDelete: json['isDelete'],
      iV: json['__v'],
    );
  }
}
