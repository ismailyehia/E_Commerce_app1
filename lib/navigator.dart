import 'package:ecommerce_course/address_pages/address_screen.dart';
import 'package:ecommerce_course/favorites_pages/favorites_screen.dart';
import 'package:ecommerce_course/home_pages/home.dart';
import 'package:ecommerce_course/order_pages/order_screen.dart';
import 'package:ecommerce_course/profile_pages/profile_screen.dart';
import 'package:ecommerce_course/reviews/review_screen.dart';

import 'package:flutter/material.dart';

class BottomNavigationBarExample extends StatefulWidget {
  BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}




class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static  List _widgetOptions = [
  Home(), OrderScreen(),
   FavoriteScreen(),
    AddressScreen(),
      ReviewScreen(),
     ProfileScreen()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_home_rounded),
            label: 'Address',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Reviews',
          ),
           BottomNavigationBarItem(
      icon: Icon(Icons.person), 
      label: 'Profile', 
    ),
          
          


        ],

        currentIndex: _selectedIndex,
        selectedItemColor: Colors.cyan[800],
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, 
      ),
    );
  }
}


