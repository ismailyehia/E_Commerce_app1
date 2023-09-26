



import 'package:ecommerce_course/reviews/review.dart';

import 'package:ecommerce_course/reviews/review_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddReview extends StatefulWidget {


  

  const AddReview({
    super.key,
    
  });


  

  @override
  State<AddReview> createState() => _AddReviewState();
}

class _AddReviewState extends State<AddReview> {
  final TextEditingController _textController = TextEditingController();
  int _rating = 0;
  int? userId; // Declare userId as nullable
  int? productId;
  



  Future<void> retrieveStoredData() async {
    final prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt('userId');
    productId = prefs.getInt('selectedProductId');
    setState(() {
          userId = prefs.getInt('userId');
    productId = prefs.getInt('selectedProductId');
    }); // Update the widget with the retrieved values
  }



  Future<int?> getStoredProductId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('selectedProductId');
  }


   void initState() {
    super.initState();
     retrieveStoredData(); // Call the function when the widget is initialized
  }




   // Function to retrieve and print the stored product ID
  Future<void> retrieveAndPrintStoredProductId() async {
    final storedProductId = await getStoredProductId();
    if (storedProductId != null) {
      // The productId is stored, you can use it as needed
      print('Stored productId: $storedProductId');
    } else {
      print('No productId stored.');
    }
  }


  

  @override
  Widget build(BuildContext context) {
    
     final reviewProvider = Provider.of<ReviewProvider>(context, listen: false);


    return Scaffold(
      appBar: AppBar(
        title: Text("Add Review"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _textController,
            decoration: InputDecoration(labelText: 'Review'),
          ),

            DropdownButton<int>(
      value: _rating,
      onChanged: (value) {
        setState(() {
          _rating = value!;
        });
      },
      items: [
        DropdownMenuItem<int>(
          value: 0,
          child: Text('0 stars'),
        ),
        DropdownMenuItem<int>(
          value: 1,
          child: Text('1 star'),
        ),
        DropdownMenuItem<int>(
          value: 2,
          child: Text('2 stars'),
        ),
        DropdownMenuItem<int>(
          value: 3,
          child: Text('3 stars'),
        ),
        DropdownMenuItem<int>(
          value: 4,
          child: Text('4 stars'),
        ),
        DropdownMenuItem<int>(
          value: 5,
          child: Text('5 stars'),
        ),
      ],
    ),
           ElevatedButton(
            onPressed: () {
              final reviewText = _textController.text;
              final reviewRating = _rating;

              if (userId != null && productId != null) {
                final newReview = Review(
                  review: reviewText,
                  rating: reviewRating,
                  userId: userId!,
                  productId: productId!,
                );

                   print('Review Text: $reviewText');
      print('Review Rating: $reviewRating');
      print('User ID: $userId');
      print('Product ID: $productId');

                
                reviewProvider.addReview(newReview);

                // Navigator.pop(context);
              } else {
                // Handle the case where userId or productId is not available
                print('UserId or ProductId not found.');
              }
            },
            child: Text('Submit Review'),
          ),
        ],
      ),
    );
  }
}


