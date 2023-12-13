import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier{
  ThemeMode currentTheme=ThemeMode.light;
  String currentLocal = "en";
  void changeTheme(ThemeMode newTheme){
    if(newTheme == currentTheme){
      return;
    }
    currentTheme =newTheme;
    notifyListeners();
  }
  void changeLocal(String newLocal){
    if(newLocal == currentLocal)return;
    currentLocal =newLocal;
    notifyListeners();
  }
bool isDarkEnabled(){
    return currentTheme == ThemeMode.dark;
}
}