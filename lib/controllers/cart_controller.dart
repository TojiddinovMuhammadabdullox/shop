import 'package:flutter/material.dart';
import 'package:hometask/models/cart.dart';
import '../models/product.dart';

class CartController with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  double get total =>
      _items.fold(0.0, (sum, item) => sum + item.product.price * item.quantity);

  void addItem(Product product) {
    final index = _items.indexWhere((item) => item.product.id == product.id);

    if (index >= 0) {
      _items[index].quantity += 1;
    } else {
      _items.add(CartItem(product: product, quantity: 1));
    }
    notifyListeners();
  }

  void updateQuantity(String productId, int quantity) {
    final index = _items.indexWhere((item) => item.product.id == productId);

    if (index >= 0) {
      if (quantity > 0) {
        _items[index].quantity = quantity;
      } else {
        _items.removeAt(index);
      }
      notifyListeners();
    }
  }

  Product findProductById(String id) {
    for (var item in _items) {
      if (item.product.id == id) {
        return item.product;
      }
    }
    // Handle the case where the product isn't found
    // return a default product or display a message in the UI
    throw Exception('Product not found');
  }
}
