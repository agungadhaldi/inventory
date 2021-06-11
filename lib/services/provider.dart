import 'package:flutter/cupertino.dart';

class SettingProvider extends ChangeNotifier {
  bool _isDark = false;
  String _name = "Agung Adhaldi";
  Color _colors = Color(0xFFF5CEB8);

  bool get isDark => _isDark;
  String get name => _name;
  Color get colors => _colors;

  set colors(Color value) {
    _colors = value;
    notifyListeners();
  }

  set name(String value) {
    _name = value;
    notifyListeners();
  }
  set isDark(bool value) {
    _isDark = value;
    notifyListeners();
  }

  Brightness get settingBrightness => (_isDark) ? Brightness.dark : Brightness.light;
}