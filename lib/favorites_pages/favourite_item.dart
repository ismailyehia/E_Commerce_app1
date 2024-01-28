class FavoriteItem {
  final int userId;
  final int productId;

  FavoriteItem({
    required this.userId,
    required this.productId,

  });


  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'productId': productId,
    };
  }
}

