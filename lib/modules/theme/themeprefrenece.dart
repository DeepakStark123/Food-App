import 'package:shared_preferences/shared_preferences.dart';

class ThemePreference {

  ///-----Set-Theme----
  setTheme(bool val) async{
    final SharedPreferences prefer = await SharedPreferences.getInstance();
    prefer.setBool("isDarkTheme",val);
  }

  ///-----get-Theme----
  Future<bool> getTheme() async{
    final SharedPreferences prefer = await SharedPreferences.getInstance();
    bool isDark = prefer.getBool("isDarkTheme")??false;
    return isDark;
  }
}