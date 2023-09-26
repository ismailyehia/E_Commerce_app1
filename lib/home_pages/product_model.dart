import 'dart:convert';

import 'package:ecommerce_course/order_pages/order.dart';
import 'package:http/http.dart' as http;



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

  Order toOrder() {
    return Order(id: productId, total: price);
  }
}























/*


import 'package:ecommerce_course/address_pages/adress_add.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:ecommerce_course/home_pages/product_provider.dart';
import 'package:ecommerce_course/home_pages/basket_provider.dart';
import 'package:ecommerce_course/home_pages/basket_model.dart';
import 'package:ecommerce_course/reviews/add_review.dart';

class OrderDetailsScreen extends StatefulWidget {
  final int productId;

  OrderDetailsScreen(this.productId, {Key? key}) : super(key: key);

  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  bool ratingPopupShown = false;

  @override
  void initState() {
    super.initState();
    retrieveAndPrintStoredProductId();
    print('widget.productId: ${widget.productId}');
  }

  Future<void> storeProductId(int productId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('selectedProductId', productId);
  }

  Future<int?> getStoredProductId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('selectedProductId');
  }

  Future<void> retrieveAndPrintStoredProductId() async {
    final storedProductId = await getStoredProductId();
    if (storedProductId != null) {
      print('Stored productId: $storedProductId');
    } else {
      print('No productId stored.');
    }
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final basketProvider = Provider.of<BasketProvider>(context);

    // Fetch the product details for the given productId
    productProvider.fetchProductDetails(widget.productId);

    if (!ratingPopupShown) {
        ratingPopupShown = true; 
      Future.delayed(Duration(seconds: 10), () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            double rating = 0.0;

            return AlertDialog(
              title: Text('Rate this product'),
              content: Column(
                children: [
                  RatingBar.builder(
                    initialRating: rating,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemSize: 40,
                    unratedColor: Colors.grey,
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (newRating) {
                      rating = newRating;
                    },
                  ),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () async {
                    await storeProductId(widget.productId);

                    final userIdPrefs = await SharedPreferences.getInstance();
                    final userId = userIdPrefs.getInt('userId');
                    final productId = await getStoredProductId();

                    if (userId != null && productId != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddReview(),
                        ),
                      );
                    } else {
                      print('UserId or ProductId not found in shared preferences.');
                    }
                  },
                  child: Text('Rate this product'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel'),
                ),
              ],
            );
          },
        );

        ratingPopupShown = true;
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Order Details'),
      ),
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, _) {
          final selectedProduct = productProvider.selectedProduct;

          if (productProvider.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (selectedProduct == null) {
            return Center(
              child: Text('Product details not available.'),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Text("Name :",style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),),
                  ListTile(
                    title: Text(' ${selectedProduct.name}'),
                  ),
                  Image.network(
                    selectedProduct.imageUrl,
                    height: 260,
                    width: 330,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ListTile(
                    title: Text('Description: ${selectedProduct.description}'),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 250),
                        child: Text(
                          "Product Rate:",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "4.1", // Replace with the actual product rating if available
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                       Icon(
                          Icons.star_outlined,
                          color: Colors.amber,
                          size: 35,
                        ),
                        Icon(
                          Icons.star_outlined,
                          color: Colors.amber,
                          size: 35,
                        ),
                        Icon(
                          Icons.star_outlined,
                          color: Colors.amber,
                          size: 35,
                        ),
                        Icon(
                          Icons.star_outlined,
                          color: Colors.amber,
                          size: 35,
                        ),
                        Icon(
                          Icons.star_outlined,
                          color: Colors.grey[350],
                          size: 35,
                        ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 70,
                      ),
                      ElevatedButton(
                        child: Text("Add to Basket"),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.orange),
                        ),
                        onPressed: () {
                          if (selectedProduct != null) {
                            basketProvider.addToBasket(BasketItem(
                              productName: selectedProduct.name,
                              imageUrl: selectedProduct.imageUrl,
                              price: selectedProduct.price,
                            ));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Added to Basket'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          }
                        },
                      ),
                      SizedBox(
                        width: 9,
                      ),
                      ElevatedButton(
                        child: Text("Take it Now!"),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                        ),
                        onPressed: () {
                          // Navigate to the address input form
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddressInputForm(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}


*/


