import 'package:flutter/cupertino.dart';

class CustomerProvider extends ChangeNotifier
{
  int selectedIndex = 0;
  setIndex(int value)
  {
    selectedIndex=value;
  }
  void onItemTapped(int index) {
      selectedIndex = index;
      notifyListeners();
  }

}