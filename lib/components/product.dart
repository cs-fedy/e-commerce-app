import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/utils/constants.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final Function() handleAddToCard;
  final Function() showDetails;
  const ProductCard({
    required this.product,
    required this.showDetails,
    required this.handleAddToCard,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: showDetails,
      child: Card(
        elevation: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 18.0 / 11.0,
                  child: Image.network(
                    product.thumbnail,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "${product.rating}",
                          style: Theme.of(context).textTheme.b12,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: Theme.of(context).textTheme.r12,
                      softWrap: true,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "TND ${product.price}",
                      style: Theme.of(context).textTheme.b12,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
