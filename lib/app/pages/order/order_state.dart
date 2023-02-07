import 'package:delivery_app_dartweek/app/dto/order_product_dto.dart';
import 'package:delivery_app_dartweek/app/models/payment_type.dart';
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

part 'order_state.g.dart';

@match
enum OrderStatus {
  initial,
  loaded,
  loading,
  error,
  updateOrder,
  confirmRemoveProduct,
  emptyBag,
  success
}

class OrderState extends Equatable {
  final OrderStatus status;
  final List<OrderProductDto> orderProducts;
  final List<PaymentTypeModel> paymentTypes;
  final String? errorMessage;

  const OrderState(
      {required this.status,
      required this.orderProducts,
      required this.paymentTypes,
      this.errorMessage});

  const OrderState.initial()
      : status = OrderStatus.initial,
        orderProducts = const [],
        paymentTypes = const [],
        errorMessage = null;

  double get totalOrder => orderProducts.fold(
      0.0, (previousValue, element) => previousValue + element.totalPrice);

  @override
  List<Object?> get props =>
      [status, orderProducts, paymentTypes, errorMessage];

  OrderState copyWith(
      {OrderStatus? status,
      List<OrderProductDto>? orderProducts,
      List<PaymentTypeModel>? paymentTypes,
      String? errorMessage}) {
    return OrderState(
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
      orderProducts: orderProducts ?? this.orderProducts,
      paymentTypes: paymentTypes ?? this.paymentTypes,
    );
  }
}

class OrderConfirmDeleteProducts extends OrderState {
  final OrderProductDto orderProduct;
  final int index;

  OrderConfirmDeleteProducts({
    super.errorMessage,
    required this.orderProduct,
    required this.index,
    required super.status,
    required super.orderProducts,
    required super.paymentTypes,
  });
}
