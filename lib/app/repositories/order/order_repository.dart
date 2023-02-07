import 'package:delivery_app_dartweek/app/dto/order_dto.dart';

import '../../models/payment_type.dart';

abstract class OrderRepository{
  Future<List<PaymentTypeModel>> getAllPaymentTypes();
  Future<void> saveOrder(OrderDto order);
}