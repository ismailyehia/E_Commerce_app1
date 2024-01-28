class BasketItem {
  final String productName;
  final String imageUrl;
  final double price;
  int quantity;

  BasketItem({
    required this.productName,
    required this.imageUrl,
    required this.price,
     this.quantity = 1,
  });

   Map<String, dynamic> toJson() {
    return {
      'productName': productName,
      'imageUrl': imageUrl,
      'price': price,
    };
  }

  // Create BasketItem from JSON
  factory BasketItem.fromJson(Map<String, dynamic> json) {
    return BasketItem(
      productName: json['productName'],
      imageUrl: json['imageUrl'] ?? 'https://placehold.jp/400x300.png',
      price: json['price'],
    );
  }



}




