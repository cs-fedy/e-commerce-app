import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/utils/get_http.dart';

class ProductAPI {
  final String _apiURL = 'https://dummyjson.com/products';

  Future<List<ProductModel>> getProducts() async {
    final data = await getData(_apiURL);
    return (data["products"] as List)
        .map((element) => ProductModel.fromJson(element))
        .toList();
  }
}
