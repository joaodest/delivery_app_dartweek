import 'dart:developer';

import 'package:delivery_app_dartweek/app/core/core/exceptions/exceptions.dart';
import 'package:delivery_app_dartweek/app/dto/order_dto.dart';
import 'package:delivery_app_dartweek/app/models/payment_type.dart';
import 'package:delivery_app_dartweek/app/repositories/order/order_repository.dart';
import 'package:dio/dio.dart';

import '../../core/core/rest_client/custom_dio.dart';

class OrderRepositoryImpl implements OrderRepository {
  final CustomDio dio;

  OrderRepositoryImpl({required this.dio});

  @override
  Future<List<PaymentTypeModel>> getAllPaymentTypes() async {
    try {
      final result = await dio.auth().get('/payment-types');
      return result.data.map<PaymentTypeModel>((p) => PaymentTypeModel.fromMap(p)).toList();
    } on DioError catch (e, s) {
      log('Erro ao buscar formas de pagamento', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar formas de pagamento');
    }
  }

  @override
  Future<void> saveOrder(OrderDto order) async {
    try {
      await dio.auth().post('/orders', data: {
        'products': order.products.map((e) => {
          'id': e.product.id,
          'amount': e.amount,
          'total_price': e.totalPrice
        }).toList(),
        'user_id': '#userAuthRed',
        'address': order.address,
        'CPF': order.document,
        'payment_method_id': order.paymentMethodId,
      });
    } on DioError catch (e, s) {
      log('Erro ao registrar pedido', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao registrar seu pedido');
    }
  }
}
