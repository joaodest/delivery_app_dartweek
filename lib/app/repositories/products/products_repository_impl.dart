import 'dart:developer';

import 'package:delivery_app_dartweek/app/core/core/exceptions/exceptions.dart';
import 'package:delivery_app_dartweek/app/core/core/rest_client/custom_dio.dart';
import 'package:delivery_app_dartweek/app/models/product_model.dart';
import 'package:delivery_app_dartweek/app/repositories/products/products_repository.dart';
import 'package:dio/dio.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final CustomDio dio;

  ProductsRepositoryImpl({required this.dio});

  @override
  Future<List<ProductModel>> findAllProducts() async {
    try {
      final result = await dio.unauth().get('/products');
      return result.data.map<ProductModel>((product) {
        return ProductModel.fromMap(product);
      }).toList();
    } on DioError catch (e, s) {
      log('Erro ao buscar produtos', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar produtos');
    }
  }
}
