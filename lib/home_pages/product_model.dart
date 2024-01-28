

// import 'package:ecommerce_course/order_pages/order.dart';
// import 'package:http/http.dart' as http;



// class Product {
//   final int productId;
//   final String name;
//   final String description;
//   final double price;
//   final String imageUrl;
//   final int stock;

//   Product({
//     required this.productId,
//     required this.name,
//     required this.description,
//     required this.price,
//     required this.imageUrl,
//     required this.stock,
//   });

//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       productId: json['product_id'] ?? 0,
//       name: json['name'] ?? 'No Name',
//       description: json['description'] ?? 'No Description',
//       price: double.tryParse(json['price'] ?? '0.0') ?? 0.0,
//       imageUrl: json['imageUrl'] ?? 'https://placehold.jp/400x300.png',
//       stock: json['stock'] ?? 0,
//     );
//   }

//   Order toOrder() {
//     return Order(id: productId, total: price);
//   }
// }
