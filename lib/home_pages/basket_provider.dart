import 'dart:convert';

import 'package:ecommerce_course/home_pages/basket_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BasketProvider extends ChangeNotifier {
  List<BasketItem> _items = [];

  List<BasketItem> get items => _items;
  List<BasketItem> get basketItems => _items;


  BasketProvider() {

    _loadBasketItems();
  }

  void addToBasket(BasketItem item) {
    _items.add(item);
    _saveBasketItems(); 
    notifyListeners();
  }

  void removeFromBasket(int index) {
    _items.removeAt(index);
    _saveBasketItems(); 
    notifyListeners();
  }


  Future<void> _loadBasketItems() async {
    final prefs = await SharedPreferences.getInstance();
    final basketItems = prefs.getStringList('basketItems');
    if (basketItems != null) {
      _items = basketItems
          .map((itemJson) => BasketItem.fromJson(
              Map<String, dynamic>.from(json.decode(itemJson))))
          .toList();
    }
  }


  Future<void> _saveBasketItems() async {
    final prefs = await SharedPreferences.getInstance();
    final basketItems =
        _items.map((item) => json.encode(item.toJson())).toList();
    prefs.setStringList('basketItems', basketItems);
  }
}

