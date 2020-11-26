import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  List<String> _selectedProducts = [];

  List<String> get selectedProducts => _selectedProducts;

  void add(String value) {
    _selectedProducts.add(value);
    notifyListeners();
  }
}
