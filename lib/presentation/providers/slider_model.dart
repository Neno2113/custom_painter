import 'package:flutter/material.dart';






class SliderModel with ChangeNotifier {

  double _currentPage = 0;

  double get currenPage => _currentPage;

  set currentPage( double newCurrentPage ) {
    _currentPage = newCurrentPage;
    print(newCurrentPage);
    notifyListeners();
  }

}