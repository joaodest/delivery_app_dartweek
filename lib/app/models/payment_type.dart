import 'dart:convert';

import 'package:flutter/cupertino.dart';

class PaymentTypeModel {
  final int id;
  final String name;
  final String acronym;
  final bool enable;

  PaymentTypeModel(
      {required this.id,
      required this.name,
      required this.acronym,
      required this.enable});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "acronym": acronym,
      "enable": enable,
    };
  }

  factory PaymentTypeModel.fromMap(Map<String, dynamic> map) {
    return PaymentTypeModel(
        id: map['id']?.toInt() ?? 0,
        name: map['name'] ?? 0,
        acronym: map['acronym'] ?? '',
        enable: map['enable'] ?? false);
  }

  String toJson() => json.encode(toMap());
  factory PaymentTypeModel.fromJson(String source) =>
      PaymentTypeModel.fromJson(json.decode(source));
}
