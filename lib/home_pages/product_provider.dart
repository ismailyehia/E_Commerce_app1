
import 'package:ecommerce_course/order_pages/order.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


//Model
class Product {
  final int productId;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final int stock;

  Product({
    required this.productId,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.stock,
  });



  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['id']?? 0,
      name: json['name'] ?? 'No Name',
      description: json['description'] ?? 'No Description',
      price: double.tryParse(json['price'] ?? '0.0') ?? 0.0,
      imageUrl: json['imageUrl'] ?? 'https://placehold.jp/400x300.png',
      stock: json['stock'] ?? 0,

    );
  }

  get id => null;
  Order toOrder() {
    return Order(id: productId, total: price);
  }

}


//Provider

class ProductProvider extends ChangeNotifier {
  
  List<Product> _products = [];
  bool _isLoading = false;
  Product? _selectedProduct;
  final String _errorMessage = '';

  Product? get selectedProduct => _selectedProduct;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  bool get hasError => _errorMessage.isNotEmpty;

  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response =
          await http.get(Uri.parse('http://10.0.2.2:8000/api/products'));

      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        _products = responseData.map((data) {
          double price = double.tryParse(data['price'] ?? '0.0') ?? 0.0;

          return Product.fromJson(data); // Use the Product.fromJson constructor
        }).toList();
      } else {
        throw Exception('Failed to fetch products');
      }

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      print('Error: $e');
    }
  }

  Future<void> fetchProductDetails(int productId) async {
    try {
      final response = await http.get(
        Uri.parse('http://10.0.2.2:8000/api/products/$productId'),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        _selectedProduct = Product.fromJson(responseData);
        notifyListeners(); // Add this line to notify listeners of the change
      } else {
        throw Exception(
            'Failed to fetch product details: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Product getSelectedProduct(int productId) {
    return _products.firstWhere(
      (product) => product.productId == productId,
      orElse: () => Product(
        productId: 0,
        name: 'No Name',
        description: 'No Description',
        price: 0.0,
        imageUrl: 'https://placehold.jp/400x300.png',
        stock: 0,

      ),
    );
  }
}
