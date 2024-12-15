import 'package:pizzeria/models/pizza.dart';
import 'package:flutter/material.dart';

class CartItem {
  final Pizza pizza;
  int quantity;

  CartItem(this.pizza, [this.quantity = 1]);
}

class Cart extends ChangeNotifier {
  List<CartItem> _items = [];

  int totalItems() { return _items.length; }
  CartItem GetItem(int index) { 
    return _items[index]; 
  }

  int findCartItemIndex(int id) {
    return _items.indexWhere((element) => element.pizza.id == id);
  }

  void addProduct(Pizza pizza) {
    int index = findCartItemIndex(pizza.id);
    if (index == -1) {
      _items.add(CartItem(pizza));
    } else {
      CartItem item = _items[index];
      item.quantity++;
    }
    notifyListeners();
  }

  void removeProduct(Pizza pizza) {
    int index = findCartItemIndex(pizza.id);
    if (index != -1) {
      _items.removeAt(index);
    }
    notifyListeners();
  }

  double prixTotal() {
    double res = 0;

    for (var item in _items) {
      res += item.pizza.price * item.quantity;
    }
    return res;
  }

  CartItem getCartItem(int index) {
    return _items[index];
  }

  int totalQuantity() {
    int res = 0;
    for (var item in _items) {
      res += item.quantity;
    }
    return res;
  }

  void incrementQuantity(int pizzaId) {
  int index = findCartItemIndex(pizzaId);
  if (index != -1) {
    _items[index].quantity++;
    notifyListeners(); // Notifie les widgets pour mettre à jour l'UI
  }
}

void decrementQuantity(int pizzaId) {
  int index = findCartItemIndex(pizzaId);
  if (index != -1) {
    if (_items[index].quantity > 1) {
      _items[index].quantity--;
    } else {
      _items.removeAt(index); // Supprime si la quantité atteint 0
    }
    notifyListeners();
  }
}

void clearCart() {
  _items.clear(); // Vide tout le panier
  notifyListeners();
}

}