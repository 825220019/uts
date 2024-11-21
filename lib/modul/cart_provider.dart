//kodingan cart provider mengikuti tutorial yt The Tech Brother

import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _cartItems = [];
  List<Map<String, dynamic>> get cartItems => _cartItems;

  double get totalAmount {
    return _cartItems.fold(
        0, (sum, item) => sum + (item['price'] * item['quantity']));
  }

  //menambah item ke keranjang.
  void addToCart(Map<String, dynamic> product) {
    int index = _cartItems.indexWhere((item) => item['id'] == product['id']);
    if (index >= 0) {
      _cartItems[index]['quantity'] += 1;
    } else {
      _cartItems.add(product);
    }
    notifyListeners();
  }

  // menghapus item dari keranjang.
  void removeFromCart(int id) {
    _cartItems.removeWhere((item) => item['id'] == id);
    notifyListeners();
  }

  // mengubah kuantitas item di keranjang.
  void updateQuantity(int id, int quantity) {
    int index = _cartItems.indexWhere((item) => item['id'] == id);
    if (index >= 0) {
      _cartItems[index]['quantity'] = quantity;
      if (_cartItems[index]['quantity'] <= 0) {
        removeFromCart(id);
      }
      notifyListeners();
    }
  }

  // menghapus semua item dalam keranjang.
  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
