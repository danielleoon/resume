import 'package:cv_daniel/values/strings.dart';
import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _locale = const Locale('es'); // Por defecto en español

  Locale get locale => _locale;

  void setLanguage(String languageCode) {
    if (_locale.languageCode == languageCode) {
      return;
    }

    _locale = Locale(languageCode);
    StringConst.setLocale(_locale);
    notifyListeners();
  }

  void toggleLanguage() {
    setLanguage(_locale.languageCode == 'es' ? 'en' : 'es');
  }
}
