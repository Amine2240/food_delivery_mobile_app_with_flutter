import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PorductsList with ChangeNotifier {
  late List _List = [];
  List get productsList => _List;

  void addItemTocart(Object item) {
    productsList.add(item);
    notifyListeners();
  }

  void deleteitem(int key) {
    productsList.remove(productsList[key]);
    notifyListeners();
  }
}
