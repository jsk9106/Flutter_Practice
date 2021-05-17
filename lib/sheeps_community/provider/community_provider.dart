import 'package:flutter/material.dart';

class CommunityProvider extends ChangeNotifier{
  int _currentPage = 0;
  int get currentPage => _currentPage;

  void changePage(int pageInt){
    _currentPage = pageInt;
    print(_currentPage);
    notifyListeners();
  }
}