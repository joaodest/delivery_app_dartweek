import 'package:delivery_app_dartweek/app/core/core/ui/styles/text_styles.dart';
import 'package:delivery_app_dartweek/app/core/core/ui/widgets/delivery_appbar.dart';
import 'package:delivery_app_dartweek/app/core/core/ui/widgets/delivery_button.dart';
import 'package:delivery_app_dartweek/app/dto/order_product_dto.dart';
import 'package:delivery_app_dartweek/app/models/product_model.dart';
import 'package:delivery_app_dartweek/app/pages/order/widget/order_field.dart';
import 'package:delivery_app_dartweek/app/pages/order/widget/order_product_tile.dart';
import 'package:delivery_app_dartweek/app/pages/order/widget/payment_types_field.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Text("Carrinho", style: context.textStyles.textTitle),
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/images/trashRegular.png'))
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 2,
              (context, index) {
                return Column(
                  children: [
                    OrderProductTile(
                      index: index,
                      orderProduct: OrderProductDto(
                        product: ProductModel.fromMap({}),
                        amount: 10,
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                    )
                  ],
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total do pedido",
                        style: context.textStyles.textExtraBold
                            .copyWith(fontSize: 16),
                      ),
                      Text(
                        r"R$ 200,00",
                        style: context.textStyles.textExtraBold
                            .copyWith(fontSize: 20),
                      )
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                OrderField(
                  title: 'Endereço de entrega',
                  controller: TextEditingController(),
                  validator: Validatorless.required('m'),
                  hintText: 'Digite um endereço',
                ),
                OrderField(
                  title: 'CPF',
                  controller: TextEditingController(),
                  validator: Validatorless.required('m'),
                  hintText: 'Digite seu CPF',
                ),
                const PaymentTypesField(),
              ],
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  color: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: DeliveryButton(
                    width: double.infinity,
                    height: 48,
                    label: "FINALIZAR",
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
