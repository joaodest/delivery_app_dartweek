import 'package:delivery_app_dartweek/app/core/core/ui/styles/colors_app.dart';
import 'package:delivery_app_dartweek/app/core/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class DeliveryIncrementDecrementButton extends StatelessWidget {
  final int amount;
  final VoidCallback incrementTap;
  final VoidCallback decrementTap;

  const DeliveryIncrementDecrementButton({
    super.key,
    required this.amount,
    required this.incrementTap,
    required this.decrementTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: decrementTap,
            child: Text(
              "-",
              style: context.textStyles.textMedium
                  .copyWith(fontSize: 22, color: Colors.grey),
            ),
          ),
          Text(
            amount.toString(),
            style: context.textStyles.textRegular
                .copyWith(fontSize: 17, color: context.colors.secondary),
          ),
          InkWell(
            onTap: incrementTap,
            child: Text(
              "+",
              style: context.textStyles.textMedium
                  .copyWith(fontSize: 22, color: context.colors.secondary),
            ),
          ),
        ],
      ),
    );
  }
}
