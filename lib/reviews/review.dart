class Review {
  final String review;
  final int rating;
  final int userId;
  final int productId;

  Review({
    required this.review,
    required this.rating,
    required this.userId,
    required this.productId,
  });

  // Factory method to create a Review object from a JSON map
  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      review: json['review'] as String,
      rating: json['rating'] as int,
      userId: json['user_id'] as int,
      productId: json['product_id'] as int,
    );
  }

  // Method to convert a Review object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'review': review,
      'rating': rating,
      'user_id': userId,
      'product_id': productId,
    };
  }
}


