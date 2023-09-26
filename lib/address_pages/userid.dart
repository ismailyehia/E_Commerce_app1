import 'package:flutter/foundation.dart';

class UserIdProvider with ChangeNotifier {
  int? _userId;

  int? get userId => _userId;

  void setUserId(int? userId) {
    _userId = userId;
    notifyListeners();
  }
}


