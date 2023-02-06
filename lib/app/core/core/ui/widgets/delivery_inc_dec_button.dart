import 'package:delivery_app_dartweek/app/core/core/ui/styles/colors_app.dart';
import 'package:delivery_app_dartweek/app/core/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class DeliveryIncrementDecrementButton extends StatelessWidget {
  final bool _compact;
  final int amount;
  final VoidCallback incrementTap;
  final VoidCallback decrementTap;

  const DeliveryIncrementDecrementButton({
    super.key,
    required this.amount,
    required this.incrementTap,
    required this.decrementTap,
  }) : _compact = false;

  const DeliveryIncrementDecrementButton.compact({
    super.key,
    required this.amount,
    required this.incrementTap,
    required this.decrementTap,
  }) : _compact = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _compact ? const EdgeInsets.all(5) : null,
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
            child: Container(
              alignment: Alignment.center,
              height: 30,
              width: 30,
              child: Text(
                "-",
                style: context.textStyles.textMedium
                    .copyWith(fontSize: _compact ? 10 : 22, color: Colors.grey),
              ),
            ),
          ),
          Text(
            amount.toString(),
            style: context.textStyles.textRegular
                .copyWith(fontSize: _compact ? 13 : 17, color: context.colors.secondary),
          ),
          InkWell(
            onTap: incrementTap,
            child: Container(
              width: 30,
              height: 30,
              alignment: Alignment.center,
              child: Text(
                "+",
                style: context.textStyles.textMedium
                    .copyWith(fontSize: _compact ? 10 : 22, color: context.colors.secondary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
