import 'dart:convert';

import 'package:ecommerce_course/order_pages/order.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OrdersProvider extends ChangeNotifier {
  List<Order> _orders = [];

  List<Order> get orders => _orders;

  Future<void> fetchOrders() async {
    try {
      final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/orders'));
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        // Assuming your JSON response contains a list of orders as objects.
        // You may need to adjust this part according to your API response structure.

        // Clear the existing orders and add the new ones
        _orders.clear();
        _orders.addAll(jsonData.map((data) => Order.fromJson(data)));

        notifyListeners();
      } else {
        throw Exception('Failed to fetch orders');
      }
    } catch (e) {
      throw Exception('Failed to fetch orders: $e');
    }
  }

   void addOrder(Order order) {
    _orders.add(order);
    notifyListeners();
     print('Order added: $order'); 
  }
}


