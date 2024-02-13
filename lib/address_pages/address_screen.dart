import 'package:ecommerce_course/address_pages/adress_add.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'address_provider.dart';

class AddressScreen extends StatefulWidget {
  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch address data when the screen initializes
    fetchData();
  }

  void fetchData() async {
    final addressProvider = Provider.of<AddressProvider>(context, listen: false);
    try {
      await addressProvider.fetchAddressData();
    } catch (e) {
      // Handle any errors that may occur during data fetching
      print('Error fetching address data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Address Screen'),
      ),
      body: Consumer<AddressProvider>(
        builder: (context, addressProvider, child) {
          final addresses = addressProvider.addresses;

          if (addresses.isNotEmpty) {
            return ListView.builder(
              itemCount: addresses.length,
              itemBuilder: (context, index) {
                final address = addresses[index];
                return Card(
                  child: ListTile(
                    title: Text('Address Line 1: ${address.addressLine1}'),
                    subtitle: Text('Zip Code: ${address.zipCode}'),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButtonLocation:  FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(onPressed: (){

        Navigator.push(context,
        MaterialPageRoute(
          builder: (context) =>   AddressInputForm(),
        ),
      );
      },

      
      child: Icon(Icons.add),
      
      ),
    );
  }
}
