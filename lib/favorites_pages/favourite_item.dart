class FavoriteItem {
  final int userId;
  final int productId;
  final String imageUrl;

  FavoriteItem({
    required this.userId,
    required this.productId,
    required this.imageUrl
  });

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'productId': productId,
      'imageUrl': imageUrl,
    };
  }
}
