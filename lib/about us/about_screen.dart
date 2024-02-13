import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to Our E-Commerce Platform!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'About Us:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pharetra tellus eget libero viverra, in hendrerit orci porta. Mauris sollicitudin nec libero at tristique. Integer nec feugiat metus. Quisque non massa sed turpis mattis tempus vel nec lorem. Aenean quis tortor lorem. Fusce tempor euismod sollicitudin. Integer et posuere leo. Integer ullamcorper, dui sit amet venenatis tincidunt, enim velit vehicula libero, ut aliquam magna nisi nec ligula. Nulla facilisi. Phasellus condimentum neque eget turpis elementum, vitae luctus elit interdum. Sed vestibulum ante eu eros fermentum, vitae tincidunt lorem egestas. Donec pharetra sem id justo rutrum posuere. Aliquam ultricies congue semper. Fusce sit amet pulvinar urna.',
            ),
            SizedBox(height: 20.0),
            Text(
              'Our Mission:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pharetra tellus eget libero viverra, in hendrerit orci porta. Mauris sollicitudin nec libero at tristique. Integer nec feugiat metus. Quisque non massa sed turpis mattis tempus vel nec lorem. Aenean quis tortor lorem. Fusce tempor euismod sollicitudin. Integer et posuere leo. Integer ullamcorper, dui sit amet venenatis tincidunt, enim velit vehicula libero, ut aliquam magna nisi nec ligula. Nulla facilisi. Phasellus condimentum neque eget turpis elementum, vitae luctus elit interdum. Sed vestibulum ante eu eros fermentum, vitae tincidunt lorem egestas. Donec pharetra sem id justo rutrum posuere. Aliquam ultricies congue semper. Fusce sit amet pulvinar urna.',
            ),
            SizedBox(height: 20.0),
            Text(
              'Contact Us:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              '1234 Example Street,\nCity, State, Zip\nEmail: info@example.com\nPhone: 123-456-7890',
            ),
          ],
        ),
      ),
    );
  }
}

