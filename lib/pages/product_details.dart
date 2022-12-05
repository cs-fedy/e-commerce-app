import 'package:e_commerce/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductDetails extends StatelessWidget {
  final ProductModel product;

  const ProductDetails({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(product.title),
      ),
    );
  }
}
