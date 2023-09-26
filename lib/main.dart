import 'package:ecommerce_course/Dark_mode/theme_provider.dart';
import 'package:ecommerce_course/address_pages/address_provider.dart';
import 'package:ecommerce_course/address_pages/userid.dart';
import 'package:ecommerce_course/favorites_pages/favourite_provider.dart';
import 'package:ecommerce_course/home_pages/basket_provider.dart';


import 'package:ecommerce_course/home_pages/order_details_screen.dart';
import 'package:ecommerce_course/home_pages/product_provider.dart';
import 'package:ecommerce_course/login_and_register/login.dart';
import 'package:ecommerce_course/navigator.dart';
import 'package:ecommerce_course/order_pages/order_provider.dart';
import 'package:ecommerce_course/profile_pages/user_profile.dart';

import 'package:ecommerce_course/reviews/review_screen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
  
  runApp(
    
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider(),child: MyApp(),),
        ChangeNotifierProvider(create: (context) => OrdersProvider(),child: MyApp(),),
         ChangeNotifierProvider(create: (context) => BasketProvider()),
         ChangeNotifierProvider(create: (context) => FavoriteProvider()),
          ChangeNotifierProvider(create: (context) => UserIdProvider()),
          ChangeNotifierProvider(create: (context) => AddressProvider()),
          ChangeNotifierProvider(create: (_) => ReviewProvider()),
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
          ChangeNotifierProvider(create: (_) => UserModel()),

        // Add other providers here if needed
      ],
      child: Builder(
        builder: (context) {
          // Call initApp with the context
          
          return MyApp();
        },
      ),
      
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Dark Mode Example',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeProvider.currentThemeMode,
      onGenerateRoute: (settings) {
        if (settings.name == '/orderDetails') {
          final productId = settings.arguments as int?;
          if (productId != null) {
            return MaterialPageRoute(
              builder: (context) => OrderDetailsScreen(productId),
            );
          }
        }
        return null; 
      },
      home: Login(), 
    );
  }
}



// Future<void> initApp(BuildContext context) async {
//   final prefs = await SharedPreferences.getInstance();
//   String? storedEmail = prefs.getString('email');
//   final userModel = Provider.of<UserModel>(context, listen: false);
//   if (storedEmail != null) {
//     userModel.setEmail(storedEmail);
//   }
// }
//BottomNavigationBarExample