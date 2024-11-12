import 'package:cv_daniel/values/strings.dart';
import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _locale = const Locale('es'); // Por defecto en español

  Locale get locale => _locale;

  void toggleLanguage() {
    _locale =
        _locale.languageCode == 'es' ? const Locale('en') : const Locale('es');
    StringConst.setLocale(_locale); // Cambia el idioma en StringConst
    notifyListeners(); // Notifica a los widgets para que se redibujen
  }
}
