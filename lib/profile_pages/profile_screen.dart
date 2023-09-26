import 'package:ecommerce_course/profile_pages/add_email.dart';
import 'package:ecommerce_course/profile_pages/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userEmail = '';
  String newEmail = '';

   String emailFromPrefs = ''; // State variable to store email from SharedPreferences

  @override
  void initState() {
    super.initState();
    // Fetch the email from SharedPreferences when the widget initializes
    getEmailFromPrefs();
  }

  // Function to fetch email from SharedPreferences
  Future<void> getEmailFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      emailFromPrefs = prefs.getString('email') ?? 'NewEmail';
    });
  }
  
  

  

  @override
  Widget build(BuildContext context) {
    final userModel = Provider.of<UserModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 115, 6, 223),
        title: Text('Profile Screen'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/batman.jpg'),
            ),
          ),
          Padding(padding: EdgeInsets.all(12)),
          
          Text(
  userModel.email.isNotEmpty
      ? 'Email: ${userModel.email}'
      : 'Email: $emailFromPrefs',
  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
),
          SizedBox(
            height: 100,
          ),
          ElevatedButton(
            child: Text("Change email"),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Color.fromARGB(255, 110, 9, 243)),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddEmail(),
                ),
              ).then((result) {
                if (result != null) {
                  // Update the email when returning from AddEmail screen
                  userModel.setEmail(result);
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
