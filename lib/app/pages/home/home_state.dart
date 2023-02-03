import 'package:delivery_app_dartweek/app/dto/order_product_dto.dart';
import 'package:delivery_app_dartweek/app/models/product_model.dart';
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

part 'home_state.g.dart';

@match
enum HomeStateStatus {
  initial,
  loading,
  loaded,
  error,
}

class HomeState extends Equatable {
  final HomeStateStatus status;
  final List<ProductModel> products;
  final String? errorMessage;
  final List<OrderProductDto> shoppingBag;

  HomeState(this.errorMessage,
      {required this.status,
      required this.products,
      required this.shoppingBag});

  const HomeState.initial()
      : status = HomeStateStatus.initial,
        products = const [],
        errorMessage = null,
        shoppingBag = const [];

  @override
  List<Object?> get props => [status, products, errorMessage, shoppingBag];

  HomeState copyWith({
    HomeStateStatus? status,
    List<ProductModel>? products,
    String? errorMessage,
    List<OrderProductDto>? shoppingBag,
  }) {
    return HomeState(
      errorMessage,
      status: status ?? this.status,
      products: products ?? this.products,
      shoppingBag: shoppingBag ?? this.shoppingBag,
    );
  }
}
