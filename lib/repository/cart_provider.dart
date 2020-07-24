import 'dart:collection';

import 'package:ecommerceapp/model/product.dart';
import 'package:flutter/foundation.dart';

class CartProvider with ChangeNotifier{
  Map<Product,int> _cart;

  CartProvider.initialize(){
    _cart = Map<Product,int>();
  }

  Map<Product, int> get cart => _cart;


  void addProduct(Product product){
    if(_cart.containsKey(product)){
      _cart[product] += 1;
    }else{
      _cart[product] = 1;
    }
    notifyListeners();
  }

  incrementProductQuantitiy(Product product){
    if(int.parse(product.quantity) - _cart[product] > 0){
      _cart[product] += 1;
    }
  }

  decrementProductQuantitiy(Product product){
    if(_cart[product] > 1){
      _cart[product] -= 1;
    }
  }

  void clearCart(){
    _cart.clear();
    notifyListeners();
  }
}