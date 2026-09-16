import 'package:flutter/material.dart';

class ShopProvider with ChangeNotifier{


  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void changeIndex(int newSelection){
    _selectedIndex=newSelection;
    notifyListeners();
  }



}