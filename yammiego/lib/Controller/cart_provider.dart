import 'package:flutter/material.dart';
import 'package:yammiego/Model/cart_items.dart';
import 'package:yammiego/Model/food.dart';


class CartProvider extends ChangeNotifier {
  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addToCart(Food food) {
    final index = _cartItems.indexWhere((item) => item?.food.id == food.id);

    if (index >= 0) {
      _cartItems[index].quantity++;
    } else {
      _cartItems.add(CartItem(food: food));
    }
    notifyListeners();
  }

  void increaseQuantity(CartItem item) {
    item.quantity++;
    notifyListeners();
  }

  void decreaseQuantity(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
    } else {
      _cartItems.remove(item);
    }
    notifyListeners();
  }

  double get totalPrice {
    return _cartItems.fold(
      0,
      (sum, item) => sum + (item.food.price * item.quantity),
    );
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
