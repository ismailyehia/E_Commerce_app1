class Order {
  final int id;
  final double total;

  Order({required this.id, required this.total});



   factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'] as int, 
      total:  double.tryParse(json['total'] ?? '0.0') ?? 0.0, 
    );
  }
}









// Expanded(
//             child: productProvider.isLoading
//                 ? Center(
//                     child: CircularProgressIndicator(),
//                   )
//                 : ListView.builder(
//                     itemCount: productProvider.products.length,
//                     itemBuilder: (context, index) {
//                       final product = productProvider.products[index];
//                       return Column(
//       children: [
//         ListTile(
//   title: Text(product.name),
//   subtitle: Text(product.description),
//   leading: Image.network(product.imageUrl),
//   trailing: Row(
//     mainAxisSize: MainAxisSize.min, // Ensure the row takes minimum space
//     children: [
//       Text('\$${product.price.toStringAsFixed(2)}'),
//       IconButton(
//         icon: Icon(Icons.add),
//         onPressed: () async {
//           // Create a new order from the selected product and add it to the order list
//           final order = product.toOrder();
//           // Assuming you have access to your OrdersProvider instance
//           final ordersProvider = Provider.of<OrdersProvider>(context, listen: false);
//           ordersProvider.addOrder(order);

//           // Navigate to the OrderDetailsScreen or any other screen you want
//           // You can pass the order ID or other information if needed.
//           await productProvider.fetchOrderDetails(1); 
//           Navigator.pushNamed(
//             context,
//             '/orderDetails', 
//             arguments: order.id,
//           );
//         },
//       ),
//     ],
//   ),
// ),
//         SizedBox(height: 7),
//          ListTile(
//   title: Text(product.name),
//   subtitle: Text(product.description),
//   leading: Image.network(product.imageUrl),
//   trailing: Row(
//     mainAxisSize: MainAxisSize.min, // Ensure the row takes minimum space
//     children: [
//       Text('\$${product.price.toStringAsFixed(2)}'),
//       IconButton(
//         icon: Icon(Icons.add),
//         onPressed: () async {
//           // Create a new order from the selected product and add it to the order list
//           final order = product.toOrder();
//           // Assuming you have access to your OrdersProvider instance
//           final ordersProvider = Provider.of<OrdersProvider>(context, listen: false);
//           ordersProvider.addOrder(order);

//           // Navigate to the OrderDetailsScreen or any other screen you want
//           // You can pass the order ID or other information if needed.
//           await productProvider.fetchOrderDetails(1); 
//           Navigator.pushNamed(
//             context,
//             '/orderDetails', 
//             arguments: order.id,
//           );
//         },
//       ),
//     ],
//   ),
// ),
//       ],
//     );
//                     },
//                   ),
//           ),