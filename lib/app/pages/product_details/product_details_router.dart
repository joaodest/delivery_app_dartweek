import 'package:delivery_app_dartweek/app/pages/product_details/product_detail_controller.dart';
import 'package:delivery_app_dartweek/app/pages/product_details/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsRouter {
  ProductDetailsRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (context) => ProductDetailController(),
          )
        ],
        builder: (context, build) {
          final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
          return ProductDetailsPage(
            product: args['product'],
            order: args['order'],
          );
        },
      );
}
