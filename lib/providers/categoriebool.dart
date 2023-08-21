import 'package:flutter/material.dart';

class Categoriebooleen with ChangeNotifier {
  bool categoriebool = true;

  void togglecategoriebool() {
    categoriebool = false;
    notifyListeners();
  }
  void togglecategorieboolforpopular() {
    categoriebool = true;
    notifyListeners();
  }
}
