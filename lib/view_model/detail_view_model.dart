import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide ChangeNotifier;
import '../models/product_model.dart';
import '../view/detail_page.dart';

class DetailViewModel extends ChangeNotifier{
  List<Product> orders = [];


  void removeProduct(Product product) {
    orders.remove(product);
    notifyListeners();
  }



  void checkProduct (value, index) {
    removeProduct(orders[index]);
    orders[index].isSelected = false;
    notifyListeners();
  }

}