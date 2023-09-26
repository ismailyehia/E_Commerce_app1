import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List<dynamic>> getData() async {
  var url = Uri.parse('http://10.0.2.2:8000/api/user');

  var response = await http.get(url);

  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    print(data);
    return data;
  } else {
    print('error:   ${response.statusCode}');
    return [];
  }
}


