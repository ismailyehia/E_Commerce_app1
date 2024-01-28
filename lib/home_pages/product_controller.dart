
/*
import 'dart:convert';

import 'package:ecommerce_course/home_pages/product_model.dart';
import 'package:ecommerce_course/home_pages/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class ProductController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    Future<void> fetchProducts() async {
      try {
        final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/products'));

        if (response.statusCode == 200) {
          final List<dynamic> responseData = json.decode(response.body);
          final List<Product> products = responseData.map((data) {
            // Parse the 'price' field as a double
            double price = double.tryParse(data['price']) ?? 0.0;

            return Product(
              productId: data['product_id'] ?? 0,
              name: data['name'] ?? 'No Name',
              description: data['description'] ?? 'No Description',
              price: price,
              imageUrl: data['imageUrl'] ?? 'https://placehold.jp/400x300.png',
              stock: data['stock'] ?? 0,
            );
          }).toList();

          productProvider.setProducts(products);
        } else {
          throw Exception('Failed to fetch products');
        }
      } catch (e) {
        print('Error: $e');
      }
    }

    // Add other methods for managing product data if needed.

    return Container();
  }
}

*/

























/*



HOME 1 


import 'dart:convert';
import 'package:ecommerce_course/Dark_mode/dark_mode.dart';
import 'package:ecommerce_course/favorites_pages/favourite_product.dart';
import 'package:ecommerce_course/favorites_pages/favourite_provider.dart';

import 'package:ecommerce_course/home_pages/basket_provider.dart';
import 'package:ecommerce_course/home_pages/basket_screen.dart';
import 'package:ecommerce_course/home_pages/categoryforproductsscreen.dart';
import 'package:ecommerce_course/home_pages/order_details_screen.dart';

import 'package:ecommerce_course/home_pages/product_provider.dart';
import 'package:ecommerce_course/profile_pages/user_profile.dart';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();

    // Fetch products when the widget is initialized
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    //productProvider.fetchProducts();

    productProvider.fetchFirstProduct();
    productProvider.fetchsecondProduct();
    productProvider.fetchthirdProduct();
    productProvider.fetchfourdProduct();
    productProvider.fetchfifthProduct();
    productProvider.fetchsixProduct();
    productProvider.fetchsevenProduct();
    productProvider.fetcheightProduct();
    productProvider.fetchnineProduct();
    productProvider.fetchtenProduct();
  }
  int? userId;
  int? productId;

  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    final productProvider = Provider.of<ProductProvider>(context);
        final  basketProvider= Provider.of<BasketProvider>(context);
        final userModel = Provider.of<UserModel>(context);

    return Scaffold(

      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/batman.jpg"), fit: BoxFit.cover),
                ),
                currentAccountPicture: CircleAvatar(
                    radius: 55, backgroundImage: AssetImage("assets/5.jpg")),
                accountEmail: Text("  ${userModel.email}"),
                accountName: Text(
                  " ",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                  title: Text("Home"),
                  leading: Icon(Icons.home),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ),
                    );
                  }),
              
              ListTile(
                  title: Text("About"),
                  leading: Icon(Icons.help_center),
                  onTap: () {}),
        
                  ListTile(
                  title: Text("Dark/light mode"),
                  leading: Icon(Icons.help_center),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DarkModeScreen(),
                      ),
                    );
                  }),
              ListTile(
                  title: Text("Logout"),
                  leading: Icon(Icons.exit_to_app),
                  onTap: () {
        
                  }),
              Container(
                margin: EdgeInsets.only(top: 260),
                child: Text("Developed by ISMAIL YEHIA © 2023",
                    style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          "Welcome to Home",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ), // Choose the appropriate icon
            onPressed: () {
              // Navigate to another screen when the button is pressed
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BasketScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 6,
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.teal[400],
                          borderRadius: BorderRadius.circular(25)),
                      child: TextButton(
                          child: Text(
                            "clothes",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () async{
                             //productProvider.fetchFirstProduct();
                             //productProvider.fetchsecondProduct();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ProductScreen(),
                                ),
                              );

                          })),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.teal[400],
                          borderRadius: BorderRadius.circular(25)),
                      child: TextButton(
                          child: Text(
                            "electornic",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ProductScreen2(),
                                ),
                              );

                          })),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.teal[400],
                          borderRadius: BorderRadius.circular(25)),
                      child: TextButton(
                          child: Text(
                            "shoes",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ProductScreen3(),
                                ),
                              );
                          })),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.teal[400],
                          borderRadius: BorderRadius.circular(25)),
                      child: TextButton(
                          child: Text(
                            "machines",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {})),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.teal[400],
                          borderRadius: BorderRadius.circular(25)),
                      child: TextButton(
                          child: Text(
                            "mobiliya",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {})),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.teal[400],
                          borderRadius: BorderRadius.circular(25)),
                      child: TextButton(
                          child: Text(
                            "cleaning",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {})),
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  labelText: 'Search Products',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      // Perform search based on searchController.text
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Add spacing
            Container(
              color: Colors.white,
              height: 90,
              width: double.infinity,
              child: FutureBuilder<Product?>(
                future: productProvider
                    .fetchFirstProduct(), // Use the future defined earlier
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError || !snapshot.hasData) {
                    return Center(
                      child: Text('Error: Failed to fetch the first product'),
                    );
                  } else {
                    final product = snapshot.data!;
                    return ListTile(
                      title: Text(product.name),
                      subtitle: Text(product.description),
                      leading: Image.network(product.imageUrl),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('\$${product.price.toStringAsFixed(2)}'),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () async {
                              await productProvider.fetchOrderDetails(1);

                              

                              final productId =1;
                              await productProvider.fetchProductDetails(productId);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      OrderDetailsScreen(productId),
                                ),
                              );
                            },
                          ),

                          SizedBox(width: 5,),

                          IconButton(
  icon: Icon(Icons.favorite_border),
  onPressed: () async {
    final favoriteProvider = Provider.of<FavoriteProvider>(context, listen: false);
    final product = snapshot.data!;
    final prefs = await SharedPreferences.getInstance();
    
    final userId = prefs.getInt('userId');
    
    final productId =1; // Use the product ID from preferences

    if (userId != null && productId != null) {
      final favoriteItem = FavoriteItem(
        
        userId: userId,
        productId: productId,
      );
      
      favoriteProvider.addToFavorites(favoriteItem);

      // Define your API URL
      final apiUrl = 'http://10.0.2.2:8000/api/wishlist'; // Replace with your API URL

      // Encode the favoriteItem to JSON
      final body = json.encode(favoriteItem.toJson());

      try {
        // Send the POST request
        final response = await http.post(
          Uri.parse(apiUrl),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body,
        );

        print('Response Status Code: ${response.statusCode}');
        print('Response Body: ${response.body}');

        if (response.statusCode == 200) {

          print('Favorite added to the database');
        } else {

          print('Failed to add favorite to the database');
        }
      } catch (e) {

        print('Error during HTTP request: $e');
      }
    } else {
      // Handle the case where userId or productId is null (e.g., user or product not available).
    }

      
  },
),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: 7,
            ),



            Container(
              color: Colors.white,
              height: 90,
              width: double.infinity,
              child: FutureBuilder<Product?>(
                future: productProvider
                    .fetchsecondProduct(), // Use the future defined earlier
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError || !snapshot.hasData) {
                    return Center(
                      child: Text('Error: Failed to fetch the first product'),
                    );
                  } else {
                    final product = snapshot.data!;
                    return ListTile(
                      title: Text(product.name),
                      subtitle: Text(product.description),
                      leading: Image.network(product.imageUrl),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('\$${product.price.toStringAsFixed(2)}'),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () async {
                              await productProvider.fetchOrderDetails(1);

                              final productId =2; 
                              await productProvider
                                  .fetchProductDetails(productId);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      OrderDetailsScreen(productId),
                                ),
                              );
                            },
                          ),
                          SizedBox(width: 5,),

                          IconButton(
  icon: Icon(Icons.favorite_border),
  onPressed: () async {
    final favoriteProvider = Provider.of<FavoriteProvider>(context, listen: false);
    final prefs = await SharedPreferences.getInstance();
    
    final userId = prefs.getInt('userId');
    final productId =2; 

    if (userId != null && productId != null) {
      final favoriteItem = FavoriteItem(
        
        userId: userId,
        productId: productId,
      );
      
      favoriteProvider.addToFavorites(favoriteItem);

      
      final apiUrl = 'http://10.0.2.2:8000/api/wishlist';

      
      final body = json.encode(favoriteItem.toJson());

      try {
        // Send the POST request
        final response = await http.post(
          Uri.parse(apiUrl),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body,
        );

        print('Response Status Code: ${response.statusCode}');
        print('Response Body: ${response.body}');

        if (response.statusCode == 200) {
          // Successful response from the API
          // You can handle the response as needed.
          print('Favorite added to the database');
        } else {
          // Handle the case where the API request failed.
          print('Failed to add favorite to the database');
        }
      } catch (e) {
        // Handle any exceptions that occur during the request.
        print('Error during HTTP request: $e');
      }
    } else {
      // Handle the case where userId or productId is null (e.g., user or product not available).
    }

      
  },
),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: 7,
            ),

            Container(
              color: Colors.white,
              height: 90,
              width: double.infinity,
              child: FutureBuilder<Product?>(
                future: productProvider
                    .fetchthirdProduct(), // Use the future defined earlier
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError || !snapshot.hasData) {
                    return Center(
                      child: Text('Error: Failed to fetch the first product'),
                    );
                  } else {
                    final product = snapshot.data!;
                    return ListTile(
                      title: Text(product.name),
                      subtitle: Text(product.description),
                      leading: Image.network(product.imageUrl),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('\$${product.price.toStringAsFixed(2)}'),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () async {
                              await productProvider.fetchOrderDetails(3);
                              final productId =
                                  3; // Replace with the appropriate product ID
                              await productProvider
                                  .fetchProductDetails(productId);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      OrderDetailsScreen(productId),
                                ),
                              );
                            },
                          ),
                          SizedBox(width: 5,),

                          IconButton(
  icon: Icon(Icons.favorite_border),
  onPressed: () async {
    final favoriteProvider = Provider.of<FavoriteProvider>(context, listen: false);
    final prefs = await SharedPreferences.getInstance();
    
    final userId = prefs.getInt('userId');
    final productId =3; // Use the product ID from preferences

    if (userId != null && productId != null) {
      final favoriteItem = FavoriteItem(
        
        userId: userId,
        productId: productId,
      );
      
      favoriteProvider.addToFavorites(favoriteItem);

      // Define your API URL
      final apiUrl = 'http://10.0.2.2:8000/api/wishlist'; // Replace with your API URL

      // Encode the favoriteItem to JSON
      final body = json.encode(favoriteItem.toJson());

      try {
        // Send the POST request
        final response = await http.post(
          Uri.parse(apiUrl),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body,
        );

        print('Response Status Code: ${response.statusCode}');
        print('Response Body: ${response.body}');

        if (response.statusCode == 200) {
          // Successful response from the API
          // You can handle the response as needed.
          print('Favorite added to the database');
        } else {
          // Handle the case where the API request failed.
          print('Failed to add favorite to the database');
        }
      } catch (e) {
        // Handle any exceptions that occur during the request.
        print('Error during HTTP request: $e');
      }
    } else {
      // Handle the case where userId or productId is null (e.g., user or product not available).
    }

      
  },
),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: 7,
            ),

            Container(
              color: Colors.white,
              height: 90,
              width: double.infinity,
              child: FutureBuilder<Product?>(
                future: productProvider
                    .fetchfourdProduct(), // Use the future defined earlier
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError || !snapshot.hasData) {
                    return Center(
                      child: Text('Error: Failed to fetch the first product'),
                    );
                  } else {
                    final product = snapshot.data!;
                    return ListTile(
                      title: Text(product.name),
                      subtitle: Text(product.description),
                      leading: Image.network(product.imageUrl),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('\$${product.price.toStringAsFixed(2)}'),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () async {
                              
                              //await productProvider.fetchOrderDetails(4);
                              final productId =4; 
                              await productProvider.fetchProductDetails(productId);

                                  //await storeProductId(productId);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      OrderDetailsScreen(productId),
                                ),
                              );
                            },
                          ),
                          SizedBox(width: 5,),
                          IconButton(
  icon: Icon(Icons.favorite_border),
  onPressed: () async {
    final favoriteProvider = Provider.of<FavoriteProvider>(context, listen: false);
    final prefs = await SharedPreferences.getInstance();
    
    final userId = prefs.getInt('userId');
    final productId =4; // Use the product ID from preferences

    if (userId != null && productId != null) {
      final favoriteItem = FavoriteItem(
        
        userId: userId,
        productId: productId,
      );
      
      favoriteProvider.addToFavorites(favoriteItem);

      // Define your API URL
      final apiUrl = 'http://10.0.2.2:8000/api/wishlist'; // Replace with your API URL

      // Encode the favoriteItem to JSON
      final body = json.encode(favoriteItem.toJson());

      try {
        // Send the POST request
        final response = await http.post(
          Uri.parse(apiUrl),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body,
        );

        print('Response Status Code: ${response.statusCode}');
        print('Response Body: ${response.body}');

        if (response.statusCode == 200) {
          // Successful response from the API
          // You can handle the response as needed.
          print('Favorite added to the database');
        } else {
          // Handle the case where the API request failed.
          print('Failed to add favorite to the database');
        }
      } catch (e) {
        // Handle any exceptions that occur during the request.
        print('Error during HTTP request: $e');
      }
    } else {
      // Handle the case where userId or productId is null (e.g., user or product not available).
    }

      
  },
),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: 7,
            ),

            Container(
              color: Colors.white,
              height: 90,
              width: double.infinity,
              child: FutureBuilder<Product?>(
                future: productProvider
                    .fetchfifthProduct(), // Use the future defined earlier
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError || !snapshot.hasData) {
                    return Center(
                      child: Text('Error: Failed to fetch the first product'),
                    );
                  } else {
                    final product = snapshot.data!;
                    return ListTile(
                      title: Text(product.name),
                      subtitle: Text(product.description),
                      leading: Image.network(product.imageUrl),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('\$${product.price.toStringAsFixed(2)}'),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () async {
                              await productProvider.fetchOrderDetails(5);
                              final productId =
                                  5; // Replace with the appropriate product ID
                              await productProvider
                                  .fetchProductDetails(productId);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      OrderDetailsScreen(productId),
                                ),
                              );
                            },
                          ),
                          SizedBox(width: 5,),
                          IconButton(
  icon: Icon(Icons.favorite_border),
  onPressed: () async {
    final favoriteProvider = Provider.of<FavoriteProvider>(context, listen: false);
    final product = snapshot.data!;
    final prefs = await SharedPreferences.getInstance();
    
    final userId = prefs.getInt('userId');
    final productId =5;// Use the product ID from preferences

    if (userId != null && productId != null) {
      final favoriteItem = FavoriteItem(
        
        userId: userId,
        productId: productId,
      );
      
      favoriteProvider.addToFavorites(favoriteItem);

      // Define your API URL
      final apiUrl = 'http://10.0.2.2:8000/api/wishlist'; // Replace with your API URL

      // Encode the favoriteItem to JSON
      final body = json.encode(favoriteItem.toJson());

      try {
        // Send the POST request
        final response = await http.post(
          Uri.parse(apiUrl),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body,
        );

        print('Response Status Code: ${response.statusCode}');
        print('Response Body: ${response.body}');

        if (response.statusCode == 200) {
          // Successful response from the API
          // You can handle the response as needed.
          print('Favorite added to the database');
        } else {
          // Handle the case where the API request failed.
          print('Failed to add favorite to the database');
        }
      } catch (e) {
        // Handle any exceptions that occur during the request.
        print('Error during HTTP request: $e');
      }
    } else {
      // Handle the case where userId or productId is null (e.g., user or product not available).
    }

      
  },
),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: 7,
            ),

            Container(
              color: Colors.white,
              height: 90,
              width: double.infinity,
              child: FutureBuilder<Product?>(
                future: productProvider
                    .fetchsixProduct(), // Use the future defined earlier
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError || !snapshot.hasData) {
                    return Center(
                      child: Text('Error: Failed to fetch the first product'),
                    );
                  } else {
                    final product = snapshot.data!;
                    return ListTile(
                      title: Text(product.name),
                      subtitle: Text(product.description),
                      leading: Image.network(product.imageUrl),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('\$${product.price.toStringAsFixed(2)}'),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () async {
                              await productProvider.fetchOrderDetails(6);
                              final productId =
                                  6; // Replace with the appropriate product ID
                              await productProvider
                                  .fetchProductDetails(productId);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      OrderDetailsScreen(productId),
                                ),
                              );
                            },
                          ),


                          SizedBox(width: 5,),
                          IconButton(
  icon: Icon(Icons.favorite_border),
  onPressed: () async {
    final favoriteProvider = Provider.of<FavoriteProvider>(context, listen: false);
    final product = snapshot.data!;
    final prefs = await SharedPreferences.getInstance();
    
    final userId = prefs.getInt('userId');
    final productId =6; // Use the product ID from preferences

    if (userId != null && productId != null) {
      final favoriteItem = FavoriteItem(
        
        userId: userId,
        productId: productId,
      );
      
      favoriteProvider.addToFavorites(favoriteItem);

      // Define your API URL
      final apiUrl = 'http://10.0.2.2:8000/api/wishlist'; // Replace with your API URL

      // Encode the favoriteItem to JSON
      final body = json.encode(favoriteItem.toJson());

      try {
        // Send the POST request
        final response = await http.post(
          Uri.parse(apiUrl),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body,
        );

        print('Response Status Code: ${response.statusCode}');
        print('Response Body: ${response.body}');

        if (response.statusCode == 200) {
          // Successful response from the API
          // You can handle the response as needed.
          print('Favorite added to the database');
        } else {
          // Handle the case where the API request failed.
          print('Failed to add favorite to the database');
        }
      } catch (e) {
        // Handle any exceptions that occur during the request.
        print('Error during HTTP request: $e');
      }
    } else {
      // Handle the case where userId or productId is null (e.g., user or product not available).
    }

      
  },
),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: 7,
            ),

            Container(
              color: Colors.white,
              height: 90,
              width: double.infinity,
              child: FutureBuilder<Product?>(
                future: productProvider
                    .fetchsevenProduct(), // Use the future defined earlier
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError || !snapshot.hasData) {
                    return Center(
                      child: Text('Error: Failed to fetch the first product'),
                    );
                  } else {
                    final product = snapshot.data!;
                    return ListTile(
                      title: Text(product.name),
                      subtitle: Text(product.description),
                      leading: Image.network(product.imageUrl),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('\$${product.price.toStringAsFixed(2)}'),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () async {
                              await productProvider.fetchOrderDetails(7);
                              final productId =
                                  7; // Replace with the appropriate product ID
                              await productProvider
                                  .fetchProductDetails(productId);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      OrderDetailsScreen(productId),
                                ),
                              );
                            },
                          ),

                          SizedBox(width: 5,),
                          IconButton(
  icon: Icon(Icons.favorite_border),
  onPressed: () async {
    final favoriteProvider = Provider.of<FavoriteProvider>(context, listen: false);
    final product = snapshot.data!;
    final prefs = await SharedPreferences.getInstance();
    
    final userId = prefs.getInt('userId');
    final productId =7; // Use the product ID from preferences

    if (userId != null && productId != null) {
      final favoriteItem = FavoriteItem(
        
        userId: userId,
        productId: productId,
      );
      
      favoriteProvider.addToFavorites(favoriteItem);

      // Define your API URL
      final apiUrl = 'http://10.0.2.2:8000/api/wishlist'; // Replace with your API URL

      // Encode the favoriteItem to JSON
      final body = json.encode(favoriteItem.toJson());

      try {
        // Send the POST request
        final response = await http.post(
          Uri.parse(apiUrl),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body,
        );

        print('Response Status Code: ${response.statusCode}');
        print('Response Body: ${response.body}');

        if (response.statusCode == 200) {
          // Successful response from the API
          // You can handle the response as needed.
          print('Favorite added to the database');
        } else {
          // Handle the case where the API request failed.
          print('Failed to add favorite to the database');
        }
      } catch (e) {
        // Handle any exceptions that occur during the request.
        print('Error during HTTP request: $e');
      }
    } else {
      // Handle the case where userId or productId is null (e.g., user or product not available).
    }

      
  },
),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: 7,
            ),

            Container(
              color: Colors.white,
              height: 90,
              width: double.infinity,
              child: FutureBuilder<Product?>(
                future: productProvider
                    .fetcheightProduct(), // Use the future defined earlier
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError || !snapshot.hasData) {
                    return Center(
                      child: Text('Error: Failed to fetch the first product'),
                    );
                  } else {
                    final product = snapshot.data!;
                    return ListTile(
                      title: Text(product.name),
                      subtitle: Text(product.description),
                      leading: Image.network(product.imageUrl),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('\$${product.price.toStringAsFixed(2)}'),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () async {
                              await productProvider.fetchOrderDetails(8);
                              final productId =
                                  8; // Replace with the appropriate product ID
                              await productProvider
                                  .fetchProductDetails(productId);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      OrderDetailsScreen(productId),
                                ),
                              );
                            },
                          ),
                          SizedBox(width: 5,),
                          IconButton(
  icon: Icon(Icons.favorite_border),
  onPressed: () async {
    final favoriteProvider = Provider.of<FavoriteProvider>(context, listen: false);
    final product = snapshot.data!;
    final prefs = await SharedPreferences.getInstance();
    
    final userId = prefs.getInt('userId');
    final productId =8; // Use the product ID from preferences

    if (userId != null && productId != null) {
      final favoriteItem = FavoriteItem(
        
        userId: userId,
        productId: productId,
      );
      
      favoriteProvider.addToFavorites(favoriteItem);

      // Define your API URL
      final apiUrl = 'http://10.0.2.2:8000/api/wishlist'; // Replace with your API URL

      // Encode the favoriteItem to JSON
      final body = json.encode(favoriteItem.toJson());

      try {
        // Send the POST request
        final response = await http.post(
          Uri.parse(apiUrl),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body,
        );

        print('Response Status Code: ${response.statusCode}');
        print('Response Body: ${response.body}');

        if (response.statusCode == 200) {
          // Successful response from the API
          // You can handle the response as needed.
          print('Favorite added to the database');
        } else {
          // Handle the case where the API request failed.
          print('Failed to add favorite to the database');
        }
      } catch (e) {
        // Handle any exceptions that occur during the request.
        print('Error during HTTP request: $e');
      }
    } else {
      // Handle the case where userId or productId is null (e.g., user or product not available).
    }

      
  },
),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: 7,
            ),

            Container(
              color: Colors.white,
              height: 90,
              width: double.infinity,
              child: FutureBuilder<Product?>(
                future: productProvider
                    .fetchnineProduct(), // Use the future defined earlier
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError || !snapshot.hasData) {
                    return Center(
                      child: Text('Error: Failed to fetch the first product'),
                    );
                  } else {
                    final product = snapshot.data!;
                    return ListTile(
                      title: Text(product.name),
                      subtitle: Text(product.description),
                      leading: Image.network(product.imageUrl),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('\$${product.price.toStringAsFixed(2)}'),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () async {
                              await productProvider.fetchOrderDetails(9);
                              final productId =
                                  9; // Replace with the appropriate product ID
                              await productProvider
                                  .fetchProductDetails(productId);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      OrderDetailsScreen(productId),
                                ),
                              );
                            },
                          ),
                          SizedBox(width: 5,),
                          IconButton(
  icon: Icon(Icons.favorite_border),
  onPressed: () async {
    final favoriteProvider = Provider.of<FavoriteProvider>(context, listen: false);
    final product = snapshot.data!;
    final prefs = await SharedPreferences.getInstance();
    
    final userId = prefs.getInt('userId');
    final productId =9; // Use the product ID from preferences

    if (userId != null && productId != null) {
      final favoriteItem = FavoriteItem(
        
        userId: userId,
        productId: productId,
      );
      
      favoriteProvider.addToFavorites(favoriteItem);

      // Define your API URL
      final apiUrl = 'http://10.0.2.2:8000/api/wishlist'; // Replace with your API URL

      // Encode the favoriteItem to JSON
      final body = json.encode(favoriteItem.toJson());

      try {
        // Send the POST request
        final response = await http.post(
          Uri.parse(apiUrl),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body,
        );

        print('Response Status Code: ${response.statusCode}');
        print('Response Body: ${response.body}');

        if (response.statusCode == 200) {
          // Successful response from the API
          // You can handle the response as needed.
          print('Favorite added to the database');
        } else {
          // Handle the case where the API request failed.
          print('Failed to add favorite to the database');
        }
      } catch (e) {
        // Handle any exceptions that occur during the request.
        print('Error during HTTP request: $e');
      }
    } else {
      // Handle the case where userId or productId is null (e.g., user or product not available).
    }

      
  },
),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: 7,
            ),

            Container(
              color: Colors.white,
              height: 90,
              width: double.infinity,
              child: FutureBuilder<Product?>(
                future: productProvider
                    .fetchtenProduct(), // Use the future defined earlier
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError || !snapshot.hasData) {
                    return Center(
                      child: Text('Error: Failed to fetch the first product'),
                    );
                  } else {
                    final product = snapshot.data!;
                    return ListTile(
                      title: Text(product.name),
                      subtitle: Text(product.description),
                      leading: Image.network(product.imageUrl),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('\$${product.price.toStringAsFixed(2)}'),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () async {
                              await productProvider.fetchOrderDetails(10);
                              final productId =
                                  10; // Replace with the appropriate product ID
                              await productProvider
                                  .fetchProductDetails(productId);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      OrderDetailsScreen(productId),
                                ),
                              );
                            },
                          ),
                          SizedBox(width: 5,),
                          IconButton(
  icon: Icon(Icons.favorite_border),
  onPressed: () async {
    final favoriteProvider = Provider.of<FavoriteProvider>(context, listen: false);
    final product = snapshot.data!;
    final prefs = await SharedPreferences.getInstance();
    
    final userId = prefs.getInt('userId');
    final productId =10;// Use the product ID from preferences

    if (userId != null && productId != null) {
      final favoriteItem = FavoriteItem(
        
        userId: userId,
        productId: productId,
      );
      
      favoriteProvider.addToFavorites(favoriteItem);

      // Define your API URL
      final apiUrl = 'http://10.0.2.2:8000/api/wishlist'; // Replace with your API URL

      // Encode the favoriteItem to JSON
      final body = json.encode(favoriteItem.toJson());

      try {
        // Send the POST request
        final response = await http.post(
          Uri.parse(apiUrl),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body,
        );

        print('Response Status Code: ${response.statusCode}');
        print('Response Body: ${response.body}');

        if (response.statusCode == 200) {
          // Successful response from the API
          // You can handle the response as needed.
          print('Favorite added to the database');
        } else {
          // Handle the case where the API request failed.
          print('Failed to add favorite to the database');
        }
      } catch (e) {
        // Handle any exceptions that occur during the request.
        print('Error during HTTP request: $e');
      }
    } else {
      // Handle the case where userId or productId is null (e.g., user or product not available).
    }

      
  },
),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: 7,
            ),
          ],
        ),
      ),
    );
  }
}


*/