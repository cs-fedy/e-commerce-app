import 'package:e_commerce/components/button.dart';
import 'package:e_commerce/components/cart_item.dart';
import 'package:e_commerce/controllers/cart.dart';
import 'package:e_commerce/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();
  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: primaryColor,
          leading: InkWell(
            child: const Icon(Icons.chevron_left),
            onTap: () => Get.back(),
          ),
          title: Text(
            "Cart page",
            style:
                Theme.of(context).textTheme.b18.copyWith(color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: InkWell(
                onTap: () => cartController.deleteCart(),
                child: const Icon(Icons.delete),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: cartController.cart.value.items.isEmpty
                    ? const Center(
                        child: Text("Card doesn't contain items"),
                      )
                    : Column(
                        children: cartController.cart.value.items
                            .map(
                              (e) => CartItem(
                                item: e,
                                incrementItems: () =>
                                    cartController.incrementItem(e.product.id),
                                decrementItems: () =>
                                    cartController.decrementItem(e.product.id),
                              ),
                            )
                            .toList(),
                      ),
              ),
            ),
            if (cartController.cart.value.items.isNotEmpty)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: Theme.of(context).textTheme.b16,
                    ),
                    Text(
                      "${cartController.getTotal()} TND",
                      style: Theme.of(context).textTheme.b16,
                    ),
                  ],
                ),
              ),
            Button(
              content: "checkout ${cartController.getTotal()} TND",
              clickHandler: () {},
              isPrimary: true,
            ),
          ],
        ),
      ),
    );
  }
}
