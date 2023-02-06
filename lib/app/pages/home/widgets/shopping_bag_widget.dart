import 'package:delivery_app_dartweek/app/core/core/extensions/formatter_extension.dart';
import 'package:delivery_app_dartweek/app/core/core/ui/helpers/size_extensions.dart';
import 'package:delivery_app_dartweek/app/core/core/ui/styles/text_styles.dart';
import 'package:delivery_app_dartweek/app/dto/order_product_dto.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShoppingBagWidget extends StatelessWidget {
  final List<OrderProductDto> bag;

  Future<void> _goOrder(BuildContext context) async {
    final navigator = Navigator.of(context);
    final sp = await SharedPreferences.getInstance();
    if(!sp.containsKey('accessToken')){
      // Envio para o login
      final loginResult = await navigator.pushNamed('/auth/login');

      if(loginResult == null || loginResult == false){
        return;
      }
    }
    // Envio para o order
     await navigator.pushNamed("/order", arguments: bag);
  }

  const ShoppingBagWidget({Key? key, required this.bag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var totalBag = bag
        .fold<double>(0.0, (total, element) => total += element.totalPrice)
        .currencyPTBR;

    return Container(

      width: context.screenWidth ,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      child: ElevatedButton(
        onPressed: () {
          _goOrder(context);
        },
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.shopping_cart_outlined,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Ver sacola",
                style: context.textStyles.textExtraBold.copyWith(fontSize: 14),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                totalBag,
                style: context.textStyles.textExtraBold.copyWith(fontSize: 14),
              ),
            )
          ],
        ),
      ),
    );
  }
}
