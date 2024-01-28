import 'package:ecommerce_course/Dark_mode/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DarkModeScreens extends StatelessWidget {
  const DarkModeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Dark Mode"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(children: [
            Icon(Icons.light_mode),
            SizedBox(
              width: 3,
            ),
            TextButton(
                onPressed: () {
                  themeProvider.toggleTheme2();
                },
                child: Text(
                  "Light",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20,
                  ),
                )),
          ]),
          SizedBox(
            height: 8,
          ),
          Row(children: [
            Icon(Icons.light_mode_outlined),
            SizedBox(
              width: 3,
            ),
            TextButton(
                onPressed: () {
                  themeProvider.toggleTheme();
                },
                child: Text(
                  "Dark",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20,
                  ),
                )),
          ]),
        ],
      ),
    );
  }
}
