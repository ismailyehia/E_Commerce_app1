class OrderDetail {
  final int id;
  final int productId;
  final int quantity;
  final double price;

  OrderDetail({
    required this.id,
    required this.productId,
    required this.quantity,
    required this.price,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) {
  return OrderDetail(
    id: json['id'] ?? 0,
    productId: json['product_id'] ?? 0, // Update key to 'product_id'
    quantity: json['quantity'] ?? 0,
    price: double.tryParse(json['price'] ?? '0.0') ?? 0.0, // Parse 'price' as double
  );
}
}



