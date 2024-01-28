import 'package:ecommerce_course/favorites_pages/favourite_item.dart';

import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<FavoriteItem> _items = [];

  List<FavoriteItem> get items => _items;

  List<int> _favoriteProductIds = [];

  List<int> get favoriteProductIds => _favoriteProductIds;

  bool isFavorite(int productId) {
    return _favoriteProductIds.contains(productId);
  }


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

  
  void addToFavoritess(int productId) {
    _favoriteProductIds.add(productId);
    notifyListeners();
  }

  void removeFromFavoritess(int productId) {
    _favoriteProductIds.remove(productId);
    notifyListeners();
  }
}