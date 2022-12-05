import 'package:e_commerce/components/home_top_bar.dart';
import 'package:e_commerce/components/product.dart';
import 'package:e_commerce/controllers/cart.dart';
import 'package:e_commerce/controllers/product.dart';
import 'package:e_commerce/pages/product_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductController productController = Get.put(ProductController());
  CartController cartController = Get.put(CartController());

  Widget _buildProducts() {
    return Expanded(
      child: GridView.builder(
        physics: const ScrollPhysics(),
        itemCount: productController.products.value.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (context, index) {
          final product = productController.products.value[index];
          return ProductCard(
            product: product,
            handleAddToCard: () => cartController.addItem(product),
            showDetails: () => Get.to(
              ProductDetails(product: product),
            ),
          );
        },
        padding: const EdgeInsets.symmetric(
          vertical: 25,
          horizontal: 20,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HomeTopBar(),
            Obx(
              () => productController.isDataLoading.isTrue
                  ? const Text("loading...")
                  : _buildProducts(),
            ),
          ],
        ),
      ),
    );
  }
}
