import 'package:flutter/material.dart';
import 'package:flutter_template/generated/l10n.dart';

class LanguageChangeProvider with ChangeNotifier {
  Locale _currentLocal = const Locale("en");

  Locale get currentLocal => _currentLocal;

  void changeLocale(String locale) {
    if (!S.delegate.supportedLocales.contains(locale)) return;
    _currentLocal = Locale(locale);
    notifyListeners();
  }
}
