import 'package:e_commerce/components/config_button.dart';
import 'package:e_commerce/models/cart_item.dart';
import 'package:e_commerce/utils/constants.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final CartItemModel item;
  final Function() incrementItems;
  final Function() decrementItems;

  const CartItem({
    required this.item,
    required this.incrementItems,
    required this.decrementItems,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFE5E5E5).withAlpha(40),
            blurRadius: 10,
            offset: const Offset(10, 10),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.network(
                  item.product.thumbnail,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(width: 21),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.product.title,
                    style: Theme.of(context).textTheme.r12,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "${item.product.price} TND",
                    style: Theme.of(context).textTheme.b12,
                  )
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ConfigButton(
                content: "-",
                clickHandler: decrementItems,
              ),
              Text(
                "${item.times}",
                style: Theme.of(context).textTheme.m16,
              ),
              ConfigButton(
                content: "+",
                clickHandler: incrementItems,
              ),
            ],
          )
        ],
      ),
    );
  }
}
