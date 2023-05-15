// ignore_for_file: use_build_context_synchronously, avoid_print
import 'package:flutter/material.dart';
import 'package:food_app/modules/theme/themeprefrenece.dart';

class ThemeController extends ChangeNotifier {
  bool _isDarkMode = false; 
  ThemePreference? _themePreference; 
  bool get isDarkMode => _isDarkMode;
  
  ThemeController(){
    _isDarkMode = false;
    _themePreference = ThemePreference();
    getPrefrence();
  }
   //-------set theme data -----------------
  set isDarkMode(bool value) {
    _isDarkMode = value;
    _themePreference!.setTheme(value);
    notifyListeners();
  }
  
  //--------get theme data -----------------
   Future<bool> getPrefrence() async{
    bool getdata = await _themePreference!.getTheme();
    _isDarkMode = getdata;
    notifyListeners();
    return _isDarkMode;
  }
}
