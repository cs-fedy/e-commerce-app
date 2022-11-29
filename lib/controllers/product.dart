import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/services/product.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  ProductAPI api = ProductAPI();
  Rx<bool> isDataLoading = true.obs;
  Rx<List<ProductModel>> products = Rx([]);

  @override
  void onInit() async {
    super.onInit();
    api.getProducts().then(
      (fetchedProducts) {
        products(fetchedProducts);
        isDataLoading(false);
      },
    );
  }
}
