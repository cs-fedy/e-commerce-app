import 'package:e_commerce/models/cart.dart';
import 'package:e_commerce/models/cart_item.dart';
import 'package:e_commerce/models/product.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  // for now I initialized the cart. Later mark this var as later init.
  // And onInit import it from firebase
  Rx<CartModel> cart = CartModel(
    items: [],
    isChecked: false,
  ).obs;

  void addItem(ProductModel product) {
    // use the clone pattern next time
    cart(
      CartModel(
        items: [
          ...cart.value.items,
          CartItemModel(
            product: product,
            times: 1,
          ),
        ],
        isChecked: cart.value.isChecked,
      ),
    );
  }

  double getTotal() {
    double total = 0;
    for (var element in cart.value.items) {
      total += element.product.price * element.times;
    }
    return total;
  }

  void incrementItem(int productId) {
    cart(
      CartModel(
        items: cart.value.items
            .map(
              (e) => CartItemModel(
                product: e.product,
                times: e.product.id == productId ? e.times + 1 : e.times,
              ),
            )
            .toList(),
        isChecked: cart.value.isChecked,
      ),
    );
  }

  void decrementItem(int productId) {
    cart(
      CartModel(
        items: cart.value.items
            .map(
              (e) => CartItemModel(
                product: e.product,
                times: e.product.id == productId ? e.times - 1 : e.times,
              ),
            )
            .toList(),
        isChecked: cart.value.isChecked,
      ),
    );
  }

  void deleteCart() {
    cart(
      CartModel(
        isChecked: false,
        items: [],
      ),
    );
  }
}
