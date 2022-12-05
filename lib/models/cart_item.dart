import 'package:e_commerce/models/product.dart';

class CartItemModel {
  final ProductModel product;
  final int times;

  CartItemModel({
    required this.product,
    required this.times,
  });
}
