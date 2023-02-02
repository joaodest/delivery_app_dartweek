import 'package:delivery_app_dartweek/app/models/product_model.dart';

abstract class ProductsRepository {
  Future<List<ProductModel>> findAllProducts();

  }
