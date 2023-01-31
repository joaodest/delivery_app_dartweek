import 'package:delivery_app_dartweek/app/core/core/config/env/env.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app_dartweek/app/dw9_delivery_app.dart';

void main() async {
  await Env.instance.load();
  runApp(const Dw9DeliveryApp());
}