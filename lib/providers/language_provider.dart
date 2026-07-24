import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String languageCode = 'en';

  void changeLanguage(String newLanguage) {
    if (languageCode == newLanguage) {
      return;
    }
    languageCode = newLanguage;
    notifyListeners();
  }
}
