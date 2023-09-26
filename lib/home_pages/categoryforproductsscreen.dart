import 'package:flutter/material.dart';


import 'package:ecommerce_course/home_pages/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

 // Import your Product class here

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Product? product1;
  Product? product2;
  Product? product5;
  Product? product6;
  Product? product7;

  @override
  void initState() {
    super.initState();
    fetchProduct1();
    fetchProduct2();
  }

  Future<void> fetchProduct1() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/products/1'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final product = Product.fromJson(responseData);
      setState(() {
        product1 = product;
      });
    } else {
      print('Failed to fetch product 1: ${response.statusCode}');
    }
  }

  Future<void> fetchProduct2() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/products/2'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final product = Product.fromJson(responseData);
      setState(() {
        product2 = product;
      });
    } else {
      print('Failed to fetch product 2: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Display'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (product1 != null)
                ProductCard(product: product1!),
              if (product2 != null)
                ProductCard(product: product2!),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Image.network(product.imageUrl),
          Text(product.name),
          Text(product.description),
          Text('Price: \$${product.price.toStringAsFixed(2)}'),
          Text('Stock: ${product.stock} available'),
        ],
      ),
    );
  }
}


















class ProductScreen2 extends StatefulWidget {
  @override
  _ProductScreenState2 createState() => _ProductScreenState2();
}

class _ProductScreenState2 extends State<ProductScreen2> {
  Product? product1;
  Product? product2;

  @override
  void initState() {
    super.initState();
    fetchProduct1();
    fetchProduct2();
    fetchProduct5();
    fetchProduct6();
    fetchProduct7();
  }

  Future<void> fetchProduct1() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/products/3'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final product = Product.fromJson(responseData);
      setState(() {
        product1 = product;
      });
    } else {
      print('Failed to fetch product 1: ${response.statusCode}');
    }
  }

  Future<void> fetchProduct2() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/products/4'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final product = Product.fromJson(responseData);
      setState(() {
        product2 = product;
      });
    } else {
      print('Failed to fetch product 2: ${response.statusCode}');
    }
  }
   Future<void> fetchProduct5() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/products/5'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final product = Product.fromJson(responseData);
      setState(() {
        product2 = product;
      });
    } else {
      print('Failed to fetch product 2: ${response.statusCode}');
    }
  }
   Future<void> fetchProduct6() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/products/6'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final product = Product.fromJson(responseData);
      setState(() {
        product2 = product;
      });
    } else {
      print('Failed to fetch product 2: ${response.statusCode}');
    }
  }
   Future<void> fetchProduct7() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/products/7'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final product = Product.fromJson(responseData);
      setState(() {
        product2 = product;
      });
    } else {
      print('Failed to fetch product 2: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Display'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (product1 != null)
                ProductCard(product: product1!),
              if (product2 != null)
                ProductCard(product: product2!),
            ],
          ),
        ),
      ),
    );
  }
}









class ProductScreen3 extends StatefulWidget {
  @override
  _ProductScreenState3 createState() => _ProductScreenState3();
}

class _ProductScreenState3 extends State<ProductScreen3> {
  Product? product1;
  Product? product2;

  @override
  void initState() {
    super.initState();
    fetchProduct1();
  }

  Future<void> fetchProduct1() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/products/8'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final product = Product.fromJson(responseData);
      setState(() {
        product1 = product;
      });
    } else {
      print('Failed to fetch product 1: ${response.statusCode}');
    }
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Display'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (product1 != null)
                ProductCard(product: product1!),
              if (product2 != null)
                ProductCard(product: product2!),
            ],
          ),
        ),
      ),
    );
  }
}




















