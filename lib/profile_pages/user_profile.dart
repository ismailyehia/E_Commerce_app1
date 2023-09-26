import 'package:flutter/foundation.dart';

class UserModel extends ChangeNotifier {
  String email = '';

  void setEmail(String newEmail) {
    email = newEmail;
    notifyListeners();
  }
}


