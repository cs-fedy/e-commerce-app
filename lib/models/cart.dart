import 'package:e_commerce/models/cart_item.dart';

class CartModel {
  final List<CartItemModel> items;
  final bool isChecked;

  CartModel({
    required this.items,
    required this.isChecked,
  });
}
