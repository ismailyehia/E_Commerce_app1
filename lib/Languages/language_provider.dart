import 'package:flutter/material.dart';

enum Language { English, Arabic }

class LanguageProvider extends ChangeNotifier {
  Language _currentLanguage = Language.English;

  Language get currentLanguage => _currentLanguage;

  void switchLanguage(Language language) {
    _currentLanguage = language;
    notifyListeners();
  }
}
