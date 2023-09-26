// import 'dart:convert';

// import 'package:ecommerce_course/reviews/review.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// class ReviewProvider with ChangeNotifier {
//   List<Review> _reviews = [];

//   List<Review> get reviews => _reviews;

//   Future<void> addReview(Review review) async {
  
//     final prefs = await SharedPreferences.getInstance();
// final userId = prefs.getInt('userId');
//     final response = await http.post(Uri.parse('http://10.0.2.2:8000/api/review'),
//     headers: <String, String>{
//       'Content-Type': 'application/json',
//     },
//     body: jsonEncode({
//       'review': review.review,
//       'rating': review.rating,
//     }),
//   );

//   print('API Response Status Code: ${response.statusCode}');
// print('API Response Body: ${response.body}');

//     if (response.statusCode == 200) {
//   // Request was successful, add the review to the local list.
//   _reviews.add(review);
//   notifyListeners();
// } else {
//   // Request failed, log the error and handle it accordingly.
//   print('API request failed with status code ${response.statusCode}');
//   print('Response body: ${response.body}');
// }

//     notifyListeners();
//   }

// }







// import 'dart:convert';
// import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;

// class Review {
//   final String review;
//   final int rating;
//   final int userId;
//   final int productId;

//   Review({
//     required this.review,
//     required this.rating,
//     required this.userId,
//     required this.productId,
//   });

//   factory Review.fromJson(Map<String, dynamic> json) {
//     return Review(
//       review: json['review'] as String,
//       rating: json['rating'] as int,
//       userId: json['user_id'] as int,
//       productId: json['product_id'] as int,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'review': review,
//       'rating': rating,
//       'user_id': userId,
//       'product_id': productId,
//     };
//   }
// }

// class ReviewProvider with ChangeNotifier {
//   List<Review> _reviews = [];

//   List<Review> get reviews => _reviews;

//   String? _saveReviewResponse;

//   bool _isSaving = false;
//   bool get isSaving => _isSaving;

//   void startSaving() {
//     _isSaving = true;
//     notifyListeners();
//   }

//   void stopSaving() {
//     _isSaving = false;
//     notifyListeners();
//   }

//   void setSaveReviewResponse(String? response) {
//     _saveReviewResponse = response;
//     notifyListeners();
//   }

//   Future<void> addReview(Review review) async {
//     final apiUrl =
//         'http://10.0.2.2:8000/api/review'; // Replace with your actual API URL

//     final headers = <String, String>{
//       'Content-Type': 'application/json',
//     };

//     final reviewData = {
//       'review': review.review,
//       'rating': review.rating,
//       'userId': review.userId, // Include the user ID in the request body
//       'productId': review.productId, // Include the product ID
//     };

//     final body = jsonEncode(reviewData);

//     try {
//       startSaving();

//       final response =
//           await http.post(Uri.parse(apiUrl), headers: headers, body: body);

//       print('API Response: ${response.statusCode} ${response.body}');

//       if (response.statusCode == 200) {
//         // Review saved successfully
//         setSaveReviewResponse('Review saved successfully');
//         // Optionally, you can reset the form fields or navigate to a different screen
//       } else {
//         // Handle API error
//         setSaveReviewResponse('Failed to save review');
//         // Print the error message received from the server
//         print('API Error: ${response.body}');
//       }
//     } catch (error) {
//       // Handle other errors
//       setSaveReviewResponse('An error occurred');
//       // Print any other error that occurred during the API call
//       print('Network Error: $error');
//     } finally {
//       stopSaving();
//     }
//   }
// }













//   Future<void> fetchReviews(int productId) async {
//     final apiUrl = 'http://10.0.2.2:8000/api/review'; // Replace with your API URL

//     try {
//       final response = await http.get(Uri.parse(apiUrl));

//       if (response.statusCode == 200) {
//         final List<dynamic> jsonList = jsonDecode(response.body);
//         _reviews = jsonList.map((json) => Review.fromJson(json)).toList();
//         notifyListeners();
//       } else {
//         // Handle API error here
//         print('API Error: ${response.statusCode}, ${response.body}');
//       }
//     } catch (error) {
//       // Handle network error
//       print('Network Error: $error');
//     }
//   }

// }

