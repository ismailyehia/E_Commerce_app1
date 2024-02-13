import 'package:ecommerce_course/favorites_pages/favourite_item.dart';
import 'package:ecommerce_course/favorites_pages/favourite_provider.dart';
import 'package:ecommerce_course/home_pages/basket_screen.dart';
import 'package:ecommerce_course/home_pages/categoryforproductsscreen.dart';

import 'package:ecommerce_course/home_pages/order_details_screen.dart';

import 'package:ecommerce_course/home_pages/product_provider.dart';
import 'package:ecommerce_course/imagesprovider/images_model.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<int, bool> favoritesMap = {};
  Set<int> favorites = {};
  

  @override
  void initState() {
    super.initState();
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    productProvider.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    final productProvider = Provider.of<ProductProvider>(context);
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    

    return Scaffold(
      //backgroundColor: ,
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BasketScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView(
        physics: const ClampingScrollPhysics(),
        //scrollDirection: Axis.vertical,
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
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductScreen(),
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
                              builder: (context) => ProductScreen2(),
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
                              builder: (context) => ProductScreen3(),
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
                        child: const Text(
                          "machines",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductScreen2(),
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
                        child: const Text(
                          "mobiliya",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductScreen(),
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
                        child: const Text(
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
          SizedBox(
            height: 10,
          ),
          Text(
            "New Products",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 7,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  height: 160,
                  width: 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/fashion10.jpg"),
                          fit: BoxFit.cover)),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  height: 160,
                  width: 300,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/fashion11.jpeg"),
                          fit: BoxFit.cover)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Trending Products",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Expanded(
            child: productProvider.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : GridView.builder(
                    shrinkWrap: true,
                    // scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),

                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns
                      crossAxisSpacing: 8.0, // Spacing between columns
                      mainAxisSpacing: 13.0, // Spacing between rows
                    ),
                    itemCount: productProvider.products.length,
                    itemBuilder: (context, index) {
                      final product = productProvider.products[index];

                      return buildProductCard(
                        context,
                        product,
                        index,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

Widget buildProductCard(
  BuildContext context,
  Product product,
  index,
) {
  final productProvider = Provider.of<ProductProvider>(context);
  final favoriteProvider = Provider.of<FavoriteProvider>(context);
  bool isFavorite = favoriteProvider.items
      .any((favoriteItem) => favoriteItem.productId == product.productId);

  return GestureDetector(
    onTap: () async {
      await productProvider.fetchProductDetails(product.productId);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OrderDetailsScreen(
            productId: product.productId,
            name: product.name,
            description: product.description,
            price: product.price,
            fx: items[index],
          ),
        ),
      );
    },
    child: Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Stack(
              children: [
                Image.asset(
                  items[index].imgpath,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 2,
                  right: 2,
                  child: IconButton(
                    icon: Icon(
                      isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                      color: isFavorite ? Colors.red : Colors.grey,
                    ),
                    onPressed: () async {
                      // final productId = product.productId;
                      // print("productId is $productId");
                      // if (favoriteProvider.isFavorite(product.productId)) {
                      //   favoriteProvider
                      //       .removeFromFavoritess(product.productId);
                      // } else {
                      //   favoriteProvider.addToFavoritess(product.productId);
                      // }

                      if (isFavorite) {
                        print('Removing from favorites...');
                        final favoriteItem = favoriteProvider.items.firstWhere(
                          (item) => item.productId == product.productId,
                        );
                        favoriteProvider.removeFromFavorites(favoriteItem);
                      } else {
                        print('Adding to favorites...');

                        final prefs = await SharedPreferences.getInstance();
                        final userId = prefs.getInt('userId');
                        Imagess? fxx;

                        if (userId != null) {
                          final favoriteItem = FavoriteItem(
                            userId: userId,
                            productId: product.productId,
                          imageUrl: items[index].imgpath
                          );
                          



                          favoriteProvider.addToFavorites(favoriteItem);
                        }

                        //     final favoriteProvider =
                        //     Provider.of<FavoriteProvider>(context, listen: false);
                        // final prefs = await SharedPreferences.getInstance();

                        // final userId = prefs.getInt('userId');
                        // final productId = product.productId;

                        // if (userId != null && productId != null) {
                        //   final favoriteItem = FavoriteItem(
                        //     userId: userId,
                        //     productId: productId,
                        //   );

                        //   // Toggle the favorite state locally
                        //   setState(() {
                        //     isFavorite = !isFavorite;
                        //     favoritesMap[product.productId] = isFavorite;
                        //   });

                        //   if (isFavorite) {
                        //     favoriteProvider.addToFavorites(favoriteItem);

                        //     // Define your API URL
                        //     const apiUrl =
                        //         'http://10.0.2.2:8000/api/wishlist'; // Replace with your API URL

                        //     // Encode the favoriteItem to JSON
                        //     final body = json.encode(favoriteItem.toJson());

                        //     try {
                        //       // Send the POST request
                        //       final response = await http.post(
                        //         Uri.parse(apiUrl),
                        //         headers: <String, String>{
                        //           'Content-Type':
                        //               'application/json; charset=UTF-8',
                        //         },
                        //         body: body,
                        //       );

                        //       print(
                        //           'Response Status Code: ${response.statusCode}');
                        //       print('Response Body: ${response.body}');

                        //       if (response.statusCode == 200) {
                        //         // Successful response from the API
                        //         // You can handle the response as needed.
                        //         print('Favorite added to the database');
                        //       } else {
                        //         // Handle the case where the API request failed.
                        //         print('Failed to add favorite to the database');
                        //       }
                        //     } catch (e) {
                        //       // Handle any exceptions that occur during the request.
                        //       print('Error during HTTP request: $e');
                        //     }
                        //   } else {
                        //     // Handle the case where you want to remove the favorite
                        //   }
                        // } else {
                        //   // Handle the case where userId or productId is null (e.g., user or product not available).
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('\$${product.price.toStringAsFixed(2)}'),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}




