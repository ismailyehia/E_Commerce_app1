import 'dart:convert';
import 'package:ecommerce_course/address_pages/address_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddressInputForm extends StatefulWidget {
  @override
  _AddressInputFormState createState() => _AddressInputFormState();
}

class _AddressInputFormState extends State<AddressInputForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController addressline1Controller = TextEditingController();
  TextEditingController addressline2Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipcodeController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  bool isSaving = false;

  void _saveAddress() async {
    final addressProvider =
        Provider.of<AddressProvider>(context, listen: false);

    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('userId');

    if (userId == null) {
      // Return if the user ID is null

      return;
    }

    if (addressProvider.isSaving) {
      // Return if the address is already being saved
      return;
    }

    if (_formKey.currentState!.validate()) {
      try {
        addressProvider.startSaving();

        final apiUrl ='http://10.0.2.2:8000/api/address';

        final headers = <String, String>{
          'Content-Type':
              'application/json', // You can add other headers here if needed
        };

        final addressData = {
          'user_id': userId,
          'first_name': firstnameController.text,
          'last_name': lastnameController.text,
          'address_line_1': addressline1Controller.text,
          'address_line_2': addressline2Controller.text,
          'city': cityController.text,
          'state': stateController.text,
          'zip_code': zipcodeController.text,
          'country': countryController.text,
        };

        final body = jsonEncode(addressData);

        final response =
            await http.post(Uri.parse(apiUrl), headers: headers, body: body);

        print('API Response: ${response.statusCode} ${response.body}');

        if (response.statusCode == 200) {
          // Address saved successfully
          addressProvider.setSaveAddressResponse('Address saved successfully');
          // Optionally, you can reset the form fields or navigate to a different screen
        } else {
          // Handle API error
          addressProvider.setSaveAddressResponse('Failed to save address');
          // Print the error message received from the server
          print('API Error: ${response.body}');
        }
      } catch (error) {
        // Handle other errors
        addressProvider.setSaveAddressResponse('An error occurred');
        // Print any other error that occurred during the API call
        print('Network Error: $error');
      } finally {
        addressProvider.stopSaving();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final addressProvider = Provider.of<AddressProvider>(context);
    return Scaffold(
      appBar: AppBar(
        // Optional: Add an AppBar if needed
        title: Text('Address Input Form'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add Address here",
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: firstnameController,
                decoration: InputDecoration(
                  hintText: "First Name",
                ),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Please enter a first name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: lastnameController,
                decoration: InputDecoration(
                  hintText: "Last Name",
                ),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Please enter a last name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: addressline1Controller,
                decoration: InputDecoration(
                  hintText: "address_line_1",
                ),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Please enter a address line 1';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: addressline2Controller,
                decoration: InputDecoration(
                  hintText: "address_line_2",
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: cityController,
                decoration: InputDecoration(
                  hintText: "city",
                ),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Please enter a address line 2';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: stateController,
                decoration: InputDecoration(
                  hintText: "state",
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: zipcodeController,
                decoration: InputDecoration(
                  hintText: "zip_code",
                ),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Please enter a zip code';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: countryController,
                decoration: InputDecoration(
                  hintText: "country",
                ),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Please enter a country';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  _saveAddress();
                  print('Save button pressed');
                  //  Navigator.push(
                  //             context,
                  //             MaterialPageRoute(builder: (context) => BottomNavigationBarExample()),
                  //           );

                  // Call the _saveAddress function here
                },
                child: Text("Save Changes"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
