import 'package:flutter_getx_test/models/product.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;

  double get totalPrice => cartItems.fold(0, (sum, item) => sum += item.price);

  int get count => cartItems.length;

  addToCart(Product product) {
    cartItems.add(product);
  }
}
