import 'package:ecommerce_course/home_pages/basket_model.dart';
import 'package:ecommerce_course/home_pages/basket_provider.dart';
import 'package:ecommerce_course/order_pages/order_detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class BasketScreen extends StatelessWidget {
  @override
  
  Widget build(BuildContext context) {
    final basketProvider = Provider.of<BasketProvider>(context);


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Basket'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: basketProvider.basketItems.length,
              itemBuilder: (context, index) {
                final basketItem = basketProvider.basketItems[index];

                return ListTile(
                  title: Text(basketItem.productName),
                  subtitle: Text('\$${basketItem.price.toStringAsFixed(2)}'),
                  leading: Image.asset(basketItem.imageUrl),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      // Add the logic to remove the item from the basket here
                      basketProvider.removeFromBasket(index);
                    },
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 0, 184, 165))
            ),
            onPressed: () {
               
              

                    Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OrderDetailScreen(basketItems: basketProvider.basketItems),
                
                ),
                    );
              

            },
            child: Text('make order now'), 
          ),
        ],
      ),
    );
  }
}



