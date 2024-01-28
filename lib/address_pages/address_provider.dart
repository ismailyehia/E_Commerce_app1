import 'dart:convert';

import 'package:ecommerce_course/address_pages/address.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class AddressProvider with ChangeNotifier {
  bool _isSaving = false;
  bool get isSaving => _isSaving;

  String? _saveAddressResponse;
  String? get saveAddressResponse => _saveAddressResponse;

  void startSaving() {
    _isSaving = true;
    notifyListeners();
  }

  void stopSaving() {
    _isSaving = false;
    notifyListeners();
  }

  void setSaveAddressResponse(String? response) {
    _saveAddressResponse = response;
    notifyListeners();
  }




  Future<void> saveAddress({
    required int userId,
    required String firstName,
    required String lastName,
    required String addressLine1,
    String? addressLine2,
    required String city,
    String? state,
    required String zipCode,
    required String country,
  }) async {
    // Your saving logic here, similar to the previous implementation

    // Simulate an API call
    await Future.delayed(Duration(seconds: 2));

    // Set response and stop saving
    setSaveAddressResponse("Address saved successfully");
    stopSaving();
  }
  




  List<Address> _addresses = []; // Assuming you have a list to store addresses

  List<Address> get addresses => _addresses;

    Future<void> fetchAddresses() async {
    startSaving(); // Start loading indicator

    try {
      final apiUrl = 'http://10.0.2.2:8000/api/address'; // Replace with your API URL
      final response = await http.get(Uri.parse(apiUrl)); // Make the GET request

      if (response.statusCode == 200) {
        // If the request is successful (status code 200)
        final List<dynamic> jsonList = json.decode(response.body);

        // Parse the response and populate the _addresses list
        _addresses = jsonList.map((json) => Address.fromJson(json)).toList();
        setSaveAddressResponse("Address data fetched successfully");
      } else {
        // Handle errors based on the response status code
        setSaveAddressResponse("Failed to fetch address data: ${response.statusCode}");
      }
    } catch (error) {
      // Handle errors, e.g., network errors, here
       print("Error fetching address data: $error"); // Log the error message
      setSaveAddressResponse("Error fetching address data: $error");
    }

    stopSaving(); // Stop loading indicator 
  }








  void setAddress(Address newAddress) {
    _address = newAddress;
    notifyListeners();
  }






 Address? _address;

  Address? get address => _address;

   Future<void> fetchAddressData() async {

    
    try {
      final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/address'));
      print(response.body);

      if (response.statusCode == 200) {
        final dynamic data = json.decode(response.body);

        if (data is List<dynamic>) { // Check if data is a List
          _addresses = List<Address>.from(data.map((addressData) {
            
            return Address(
              addressLine1: addressData['address_line_1'],
              zipCode: addressData['zip_code'],
              
            );
          }));
          notifyListeners();
        } else {
          throw Exception('API response does not match expected structure.');
        }
      } else {
        throw Exception('Failed to load address data');
      }
    } catch (e) {
      throw Exception('Error fetching address data: $e');
    }
  }


}


