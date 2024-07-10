import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageChangeController with ChangeNotifier {
  Locale? _appLocale;
  Locale? get appLocale => _appLocale;

  LanguageChangeController(this._appLocale);

  void changeLanguage(Locale type) async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    if (type == const Locale('en')) {
      _appLocale = type;
      await sp.setString('language_code', 'en');
    } else {
      _appLocale = type;
      await sp.setString('language_code', 'ar');
    }
    notifyListeners();
  }
}
