import 'package:flutter/widgets.dart';

class LanguageProvider with ChangeNotifier {
  String _selectedLanguage = 'English';

  String get selectedLanguage => _selectedLanguage;

  void setSelectedLanguage(String newLanguage) {
    _selectedLanguage = newLanguage;
    notifyListeners();
  }
}
