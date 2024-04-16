import 'package:flutter/material.dart';


class MenuRepositorie extends ChangeNotifier {
  int current = 0;

  click(int newIndex, context){
    current = newIndex;
    switch (newIndex) {
      case 0:
        Navigator.of(context).pushNamed('/');
      break;
      case 1:
        Navigator.of(context).pushNamed('/team'); 
      break;
      case 2:
        Navigator.of(context).pushNamed('/list'); 
      break;
      default:
        Navigator.of(context).pushNamed('/');
    }
    notifyListeners();
  }
}