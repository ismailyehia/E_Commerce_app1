import 'dart:convert';

import 'package:ecommerce_course/favorites_pages/favourite_provider.dart';
import 'package:ecommerce_course/home_pages/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final favorites = favoriteProvider.items;

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: favorites.isEmpty
          ? Center(
              child: Text('No favorite items yet.'),
            )
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final favorite = favorites[index];

                return FutureBuilder(
                  future: _fetchProductDetails(favorite.productId),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // While waiting for data, return a loading indicator or placeholder
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      // Handle errors
                      return Text('Error: ${snapshot.error}');
                    } else if (!snapshot.hasData) {
                      // Handle the case where data is not available
                      return Text('No data available');
                    } else {
                      final productDetails = snapshot.data as Product;

                      return ListTile(
                        title: Text(productDetails.name),
                        leading: Image.network(productDetails.imageUrl),
                        subtitle: Text('\$${productDetails.price.toStringAsFixed(2)}'),
                        trailing: IconButton(
                          icon: Icon(Icons.favorite),
                          color: Colors.red, // Change the color to indicate it's a favorite
                          onPressed: () {
                            // Remove the favorite from the list and database
                            favoriteProvider.removeFromFavorites(favorite);

                            // TODO: Send a request to remove the favorite from the database (API call)
                          },
                        ),
                      );
                    }
                  },
                );
              },
            ),
    );
  }

  Future<Product> _fetchProductDetails(int productId) async {
    
    try {
      // Example using the http package
      final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/products/$productId'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return Product.fromJson(data);
      } else {
        throw Exception('Failed to fetch product details');
      }
    } catch (e) {
      print('Error fetching product details: $e');
      return Product(
        productId: productId,
        name: 'Product Name',
        imageUrl: 'https://placehold.jp/400x300.png',
        price: 0.0,
        description: 'Product Description',
        stock: 0,
      );
    }
  }
}



