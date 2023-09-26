import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ecommerce_course/home_pages/basket_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderDetailScreen extends StatefulWidget {
  final List<BasketItem> basketItems;

  OrderDetailScreen({required this.basketItems});

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  double total = 0.0;
  
  

  @override
  void initState() {
    super.initState();
    calculateTotal();
  }

  void calculateTotal() {
    total = widget.basketItems
        .fold(0.0, (prev, item) => prev + (item.price * item.quantity));
  }


    Future<void> postOrderToApi(int userId, double total) async {
    final apiUrl = 'http://10.0.2.2:8000/api/orders'; // Replace with your API URL
    final body = jsonEncode({
      'userId': userId,
      'total': total,
      // Add any other order-related data here
    });

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: body,
    );

    if (response.statusCode == 200) {
      // Order successfully posted, you can handle the response as needed
      print('Order successfully posted.');
    } else {
      // Handle the error, such as showing an error message
      print('Error posting order: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order detail"),
        centerTitle: true,
      ),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
            itemCount: widget.basketItems.length,
            itemBuilder: (context, index) {
              final basketItem = widget.basketItems[index];

              return ListTile(
                title: Text('Price: \$${basketItem.price.toStringAsFixed(2)}'),
                subtitle: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          if (basketItem.quantity > 1) {
                            basketItem.quantity--;
                            calculateTotal();
                          }
                        });
                      },
                    ),
                    Text('${basketItem.quantity}'),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          basketItem.quantity++;
                          calculateTotal();
                        });
                      },
                    ),
                  ],
                ),
                leading: Image.network(basketItem.imageUrl),
              );
            },
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Color.fromARGB(255, 0, 184, 165))),
          onPressed: () async {
            
            final prefs = await SharedPreferences.getInstance();
            final userId = prefs.getInt('userId');

              if (userId != null && widget.basketItems.isNotEmpty) {
                await postOrderToApi(userId, total);
                // You can navigate to a success page or clear the basket items here
              }


          },
          child: Text('Finish'),
        ),
      ]),
      bottomSheet: Container(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Total: \$${total.toStringAsFixed(2)}',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}


