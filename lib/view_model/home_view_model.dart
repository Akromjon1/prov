import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide ChangeNotifier;
import '../models/product_model.dart';
import '../view/detail_page.dart';

class HomeViewModel extends ChangeNotifier{
  List<Product> orders = [];
  List<Product> items = [
    Product("1", "Apple", "5000", "https://images.unsplash.com/photo-1619546813926-a78fa6372cd2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"),
    Product("2", "Peach", "8000", "https://images.unsplash.com/photo-1642372849486-f88b963cb734?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80"),
    Product("3", "Apricot", "6000", "https://images.unsplash.com/photo-1624835020714-f9521e3e1421?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80"),
    Product("4", "Pear", "7000", "https://images.unsplash.com/photo-1615485925694-a03ef8fd9e12?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"),
  ];
  void addProduct(Product product) {
    orders.add(product);
    notifyListeners();
  }

  void removeProduct(Product product) {
    orders.remove(product);
    notifyListeners();
  }

  void navigateDetail(context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DetailPage()));

  }

  void checkProduct (value, index) {
    items[index].isSelected = !items[index].isSelected;
    print(orders.length);
    notifyListeners();
    if(items[index].isSelected) {
      addProduct(items[index]);
    } else {
      removeProduct(items[index]);
    }
    notifyListeners();
  }

}