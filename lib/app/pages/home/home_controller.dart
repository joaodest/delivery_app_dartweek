import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:delivery_app_dartweek/app/dto/order_product_dto.dart';
import 'package:delivery_app_dartweek/app/models/product_model.dart';
import 'package:delivery_app_dartweek/app/pages/home/home_state.dart';
import 'package:delivery_app_dartweek/app/repositories/products/products_repository.dart';
import 'package:equatable/equatable.dart';


class HomeController extends Cubit<HomeState> {
  final ProductsRepository _productsRepository;

  HomeController(this._productsRepository) : super(const HomeState.initial());
  
  
  Future<void> loadProducts() async {
    emit(state.copyWith(status: HomeStateStatus.loading));
    try {
      final products = await _productsRepository.findAllProducts();
      emit(state.copyWith(status: HomeStateStatus.loaded, products: products));
    } catch (e, s) {
      log('Erro ao buscar produtor', error: e, stackTrace: s);
      emit(state.copyWith(status: HomeStateStatus.error, errorMessage: 'Erro ao buscar produtos'),);
    }
  }

  void addOrUpdateBag(OrderProductDto orderProduct) {
    final shoppingBag = [...state.shoppingBag];
    final orderIndex = shoppingBag.indexWhere((orderP) => orderP.product == orderProduct.product);

    if(orderIndex > -1){
      if(orderProduct.amount == 0){
        shoppingBag.removeAt(orderIndex);
      } else {
        shoppingBag[orderIndex] = orderProduct;
      }
    } else {
      shoppingBag.add(orderProduct);
    }

    emit(state.copyWith(shoppingBag: shoppingBag));
  }
}
