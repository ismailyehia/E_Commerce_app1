import 'package:ecommerce_course/favorites_pages/favourite_product.dart';
import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  List<FavoriteItem> _items = [];

  List<FavoriteItem> get items => _items;

  // Define a method to get the list of favorite items
  List<FavoriteItem> getFavoriteItems() {
    return _items;
  }

  void addToFavorites(FavoriteItem item) {
    _items.add(item);
    notifyListeners();
  }

  void removeFromFavorites(FavoriteItem item) {
    _items.remove(item);
    notifyListeners();
  }
}