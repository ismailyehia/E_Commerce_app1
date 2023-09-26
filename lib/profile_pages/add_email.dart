import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddEmail extends StatefulWidget {
  const AddEmail({super.key});

  @override
  State<AddEmail> createState() => _AddEmailState();
}

class _AddEmailState extends State<AddEmail> {
    TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
       body: Column(
                children: [
                  Padding(padding: EdgeInsets.all(20)),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "change email",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    child: Text("Change"),
                    onPressed: () async {
                      final newEmail = emailController.text;
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setString('email', newEmail);
    
    // Close the AddEmail screen and pass the new email back
    Navigator.pop(context, newEmail);



  
  }

                  ),
                ],
              ),
            );
          }
        }
    


