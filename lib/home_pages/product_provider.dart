import 'package:ecommerce_course/home_pages/order_details.dart';
import 'package:ecommerce_course/order_pages/order.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
      productId: json['product_id'] ?? 0,
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






class ProductProvider extends ChangeNotifier {
  List<Product> _products = [];
  bool _isLoading = false;
   Product? _selectedProduct;
   String _errorMessage = '';

    Product? get selectedProduct => _selectedProduct;

  

  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  get product => null;

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
















   Future<Product?> fetchFirstProduct() async {
    try {
      final response = await http.get(
        Uri.parse('http://10.0.2.2:8000/api/products/1'), // Replace with your API endpoint
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final product = Product.fromJson(responseData);
        return product; // Return the fetched product
      } else {
        throw Exception('Failed to fetch the first product: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      return null; // Handle the error gracefully
    }
  }



Future<Product?> fetchsecondProduct() async {
    try {
      final response = await http.get(
        Uri.parse('http://10.0.2.2:8000/api/products/2'), // Replace with your API endpoint
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final product = Product.fromJson(responseData);
        return product; // Return the fetched product
      } else {
        throw Exception('Failed to fetch the first product: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      return null; // Handle the error gracefully
    }
  }




  
Future<Product?> fetchthirdProduct() async {
    try {
      final response = await http.get(
        Uri.parse('http://10.0.2.2:8000/api/products/3'), // Replace with your API endpoint
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final product = Product.fromJson(responseData);
        return product; // Return the fetched product
      } else {
        throw Exception('Failed to fetch the first product: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      return null; // Handle the error gracefully
    }
  }



Future<Product?> fetchfourdProduct() async {
    try {
      final response = await http.get(
        Uri.parse('http://10.0.2.2:8000/api/products/4'), // Replace with your API endpoint
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final product = Product.fromJson(responseData);
        return product; // Return the fetched product
      } else {
        throw Exception('Failed to fetch the first product: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      return null; // Handle the error gracefully
    }
  }


  
Future<Product?> fetchfifthProduct() async {
    try {
      final response = await http.get(
        Uri.parse('http://10.0.2.2:8000/api/products/5'), // Replace with your API endpoint
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final product = Product.fromJson(responseData);
        return product; // Return the fetched product
      } else {
        throw Exception('Failed to fetch the first product: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      return null; // Handle the error gracefully
    }
  }






Future<Product?> fetchsixProduct() async {
    try {
      final response = await http.get(
        Uri.parse('http://10.0.2.2:8000/api/products/6'), // Replace with your API endpoint
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final product = Product.fromJson(responseData);
        return product; // Return the fetched product
      } else {
        throw Exception('Failed to fetch the first product: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      return null; // Handle the error gracefully
    }
  }





Future<Product?> fetchsevenProduct() async {
    try {
      final response = await http.get(
        Uri.parse('http://10.0.2.2:8000/api/products/7'), // Replace with your API endpoint
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final product = Product.fromJson(responseData);
        return product; // Return the fetched product
      } else {
        throw Exception('Failed to fetch the first product: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      return null; // Handle the error gracefully
    }
  }





Future<Product?> fetcheightProduct() async {
    try {
      final response = await http.get(
        Uri.parse('http://10.0.2.2:8000/api/products/8'), // Replace with your API endpoint
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final product = Product.fromJson(responseData);
        return product; // Return the fetched product
      } else {
        throw Exception('Failed to fetch the first product: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      return null; // Handle the error gracefully
    }
  }















Future<Product?> fetchnineProduct() async {
    try {
      final response = await http.get(
        Uri.parse('http://10.0.2.2:8000/api/products/9'), // Replace with your API endpoint
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final product = Product.fromJson(responseData);
        return product; // Return the fetched product
      } else {
        throw Exception('Failed to fetch the first product: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      return null; // Handle the error gracefully
    }
  }









Future<Product?> fetchtenProduct() async {
    try {
      final response = await http.get(
        Uri.parse('http://10.0.2.2:8000/api/products/10'), // Replace with your API endpoint
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final product = Product.fromJson(responseData);
        return product; // Return the fetched product
      } else {
        throw Exception('Failed to fetch the first product: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      return null; // Handle the error gracefully
    }
  }


















List<OrderDetail> _orderDetails = [];
  List<OrderDetail> get orderDetails => _orderDetails;

  Future<void> fetchOrderDetails(int productId) async {
    try {
      final response = await http.get(
        Uri.parse('http://10.0.2.2:8000/api/order_details/$productId'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        _orderDetails = responseData
            .map((data) => OrderDetail.fromJson(data))
            .toList();
      } else {
        throw Exception('Failed to fetch order details');
      }

      notifyListeners();
    } catch (e) {
      print('Error: $e');
    }
  }




   Future<void> fetchProductDetails(int productId) async {
    try {
      final response = await http.get(
        Uri.parse('http://10.0.2.2:8000/api/products/$productId'), // Replace with your API endpoint
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        _selectedProduct = Product.fromJson(responseData);
        notifyListeners();
        
      } else {
        throw Exception('Failed to fetch product details: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }





 void setSelectedProduct(int productId) {
  // Find the product with the given productId
  final product = _products.firstWhere((p) => p.productId == productId, orElse: () => null as Product);
  
  if (product != null) {
    _selectedProduct = product;
    notifyListeners();
  } else {
    // Handle the case when no product with the given productId is found
    print('Error: Product with productId $productId not found');
  }
}






  


}




