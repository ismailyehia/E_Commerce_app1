import 'dart:convert';

import 'package:ecommerce_course/reviews/review.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReviewProvider with ChangeNotifier {
  List<Review> _reviews = [];

  List<Review> get reviews => _reviews;

  Future<void> fetchReviews() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userId = prefs.getInt('userId');
      final response = await http.get(
        Uri.parse('http://10.0.2.2:8000/api/review'), // Replace with your API endpoint
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        _reviews = data.map((item) => Review.fromJson(item)).toList();
        notifyListeners();
      } else {
        print('API request failed with status code ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (error) {
      print('Error fetching reviews: $error');
    }
  }

  
    Future<void> addReview(Review review) async {

    final prefs = await SharedPreferences.getInstance();
final userId = prefs.getInt('userId'); 
    final response = await http.post(
    Uri.parse('http://10.0.2.2:8000/api/review'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      'review': review.review,
      'rating': review.rating,
    }),
  );

    if (response.statusCode == 200) {
  // Request was successful, add the review to the local list.
  _reviews.add(review);
  notifyListeners();
} else {
  // Request failed, log the error and handle it accordingly.
  print('API request failed with status code ${response.statusCode}');
  print('Response body: ${response.body}');
}


    notifyListeners();
  }


  
}








class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch reviews and ratings when the screen is initialized
    Provider.of<ReviewProvider>(context, listen: false).fetchReviews();
  }

  @override
  Widget build(BuildContext context) {
    final reviewProvider = Provider.of<ReviewProvider>(context);
    final reviews = reviewProvider.reviews;

    return Scaffold(
      appBar: AppBar(
        title: Text("Reviews"),
      ),
      body: ListView.builder(
        itemCount: reviews.length,
        itemBuilder: (ctx, index) {
          final review = reviews[index];
          return ListTile(
            title: Text('Rating: ${review.rating.toString()}'),
            subtitle: Text(review.review),
            leading: Image.network('https://placehold.jp/400x300.png'),
          );
        },
      ),
    );
  }
}
