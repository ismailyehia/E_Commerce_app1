import 'package:ecommerce_course/home_pages/home.dart';
import 'package:ecommerce_course/navigator.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    super.initState();
  }

  bool isLoading = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? errorMsg;

  Future<void> login(String email, String password) async {
    try {
      final response = await http.get(
        Uri.parse('http://10.0.2.2:8000/api/user'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> users = json.decode(response.body);
         int userId = -1;

        bool loggedIn = false;

        for (var user in users) {
          if (user['email'] == email && user['password'] == password) {
            userId = user['id'];
            loggedIn = true;

            break;
          }
        }

        if (loggedIn) {
           final prefs = await SharedPreferences.getInstance();
        prefs.setString('email', email);
        prefs.setInt('userId', userId); // Save the user's ID

         print("User ID: $userId"); // Print user ID to the console
        print("Email: $email");   // Print email to the console



          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: (context) => BottomNavigationBarExample()),
          );
        } else {
          setState(() {
            errorMsg = "Invalid email or password.";
          });
        }
      } else {
        setState(() {
          errorMsg = "Failed to fetch users.";
        });
      }
    } catch (e) {
      setState(() {
        errorMsg = "An error occurred.";
      });
    }
  }



 Future<void> register(
  String name,
  String email,
  String password,
) async {
  final registrationData = {
    'name': name,
    'email': email,
    'password': password,
  };

  try {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8000/api/user'),
      body: registrationData,
    );

    if (response.statusCode == 201) {
      final tokenResponse = await http.post(
        Uri.parse('http://10.0.2.2:8000/api/create/token'), 
        body: {
          'email': email,
          'password': password,
          'device_name': 'iphonepromax', 
        },
      );
      print("Token Response Status Code: ${tokenResponse.statusCode}");

      if (tokenResponse.statusCode == 200) {
        final token = tokenResponse.body; 
        print("Token Response Status Code: ${tokenResponse.statusCode}");
        print("Token: $token");

        // Parse the user ID from the token
        final List<String> tokenParts = token.split('|');
        if (tokenParts.length == 2) {
          final userId = int.tryParse(tokenParts[0]);
          if (userId != null) {
            print("User ID: $userId");
            print("Email: $email");
            
            // Save the user ID and token to SharedPreferences
            final prefs = await SharedPreferences.getInstance();
            prefs.setInt('userId', userId);
            prefs.setString('token', token);
            prefs.setString('email', email);
          }
        }

        await Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => BottomNavigationBarExample(),
          ),
        );
      } else {
        setState(() {
          errorMsg = "Failed to create token after registration.";
        });
      }
    } else {
      setState(() {
        errorMsg = "Failed to register user.";
      });
    }
  } catch (e) {
    print("Error Details: $e");
    setState(() {
      errorMsg = "An error occurred.";
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[400],
        title: Text("Login"),
        centerTitle: true,
      ),
      body: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(17),
          children: [
            Text(
              "Login as user",
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Email",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: "Password",
              ),
              obscureText: true,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              child: Text("Login"),
              onPressed: () async {
                final email = emailController.text;
                final password = passwordController.text;
                login(email, password);

                // final SharedPreferences prefs =
                //     await SharedPreferences.getInstance();
                // prefs.setString('email', emailController.text);
              },
            ),
            if (errorMsg != null)
              Text(
                errorMsg!,
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Register",
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Name",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Email",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: "Password",
              ),
              obscureText: true,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                child: Text("Register"),
                onPressed: () {
                  final name = nameController.text;
                  final email = emailController.text;
                  final password = passwordController.text;
                  register(name, email, password);
                }),
          ]),
    );
  }
}


