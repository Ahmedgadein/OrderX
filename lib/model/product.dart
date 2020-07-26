import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Product{
  //Table names
  String NAME = "product_name";
  String CATEGORY = "category";
  String BRAND = "brand";
  String DETAILS = "details";

  String QUANTITY = "quantity";
  String PRICE = "price";
  String OLD_PRICE = "old_price";

  String IMAGE1 = "image1";
  String IMAGE2 = "image2";
  String IMAGE3 = "image3";

  String FEATURED = "featured";
  String NEW = "new";
  String ONSALE = "onSale";

  String SIZES = "sizes";
  String COLORS = "colors";



  //Fields
  String _name;
  String _category;
  String _brand;
  String _details;

  String _picture1;
  String _picture2;
  String _picture3;

  String _price;
  String _old_price;
  String _quantity;

  bool _featured;
  bool _onSale;
  bool _new;

  List<String> _sizes = List<String>();
  List<String> _colors = List<String>();

  //Getters
  String get name => _name;
  String get category => _category;
  String get brand => _brand;
  String get details => _details;

  String get Pic1 => _picture1;
  String get pic2 => _picture2;
  String get Pic3 => _picture3;

  String get price => _price;
  String get oldPrice => _old_price;
  String get quantity => _quantity;

  bool get featured => _featured;
  bool get onSale => _onSale;
  bool get isNew => _new;

  List<String> get sizes => _sizes;
  List<String> get colors => _colors;

  String orderSize = "NA";
  String orderColor = "NA";
  String orderQuantity = "1";

  //Constructor
  Product.fromSnapshot(DocumentSnapshot snapshot){
    Map data = snapshot.data;
    _name = data[NAME];
    _category = data[CATEGORY];
    _brand = data[BRAND];
    _details = data[DETAILS];

    _picture1 = data["image1"];
    _picture2 = data["image2"];
    _picture3 = data["image3"];

    _price = data[PRICE];
    _old_price = data[OLD_PRICE];
    _quantity = data[QUANTITY];

    _new = data[NEW];
    _featured = data[FEATURED];
    _onSale = data[ONSALE];

    Map<String,dynamic> sizes = data[SIZES];
    for(int i=0; i< sizes.length; i++){
      _sizes.add(sizes["size$i"]);
    }

    Map<String,dynamic> colors = data[COLORS];
    for(int i=0; i< colors.length; i++){
      _colors.add(colors["color$i"]);
    }

  }
}