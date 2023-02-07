import 'package:delivery_app_dartweek/app/pages/order/order_controller.dart';
import 'package:delivery_app_dartweek/app/pages/order/order_page.dart';
import 'package:delivery_app_dartweek/app/repositories/order/order_repository.dart';
import 'package:delivery_app_dartweek/app/repositories/order/order_repository_impl.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class OrderRouter {
  OrderRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<OrderRepository>(create: (context) => OrderRepositoryImpl(dio:context.read())),
          Provider(create: (context)=> OrderController(context.read()))
        ],
        child: const OrderPage(),
      );
}
