import 'package:e_commerce/models/product.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final ProductModel product;

  const ProductDetails({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.network(
              product.thumbnail,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
