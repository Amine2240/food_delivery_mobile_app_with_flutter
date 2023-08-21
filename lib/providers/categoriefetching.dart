import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Fetchingcategories with ChangeNotifier {
  List fetchedcategorylist = [];
  void fetchcategorieelements(String value) async {
    try {
      var response = await Dio()
          .get('https://www.themealdb.com/api/json/v1/1/filter.php?c=$value');
      if (response.data != null && response.data['meals'] != null) {
        fetchedcategorylist = response.data['meals'];
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}
