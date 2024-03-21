import 'dart:collection';

import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List<Item> _items = [];

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  void addItem(int id, Item item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(int id, Item item) {
    _items.remove(item);
    notifyListeners();
  }

  void clearItem() {
    _items.clear();
    notifyListeners();
  }

  int get totalPrice {
    int total = 0;

    for (int i = 0; i < _items.length; i++) {
      total += _items[i].price;
    }
    return total;
  }
}

class Item {
  final int id;
  final String name;
  int price;

  Item(this.id, this.name, this.price);
}
