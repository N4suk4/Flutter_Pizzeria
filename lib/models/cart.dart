import 'package:pizzeria/models/pizza.dart';

class CartItem {
  final Pizza pizza;
  int quantity;

  CartItem(this.pizza, [this.quantity = 1]);
}

class Cart {
  List<CartItem> _items = [];

  int TotalItems() { return _items.length; }
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
  }

  void removeProduct(Pizza pizza) {
    int index = findCartItemIndex(pizza.id);
    if (index != -1) {
      _items.removeAt(index);
    }
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
}