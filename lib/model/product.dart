import 'package:flutter/material.dart';

class Product{
  String name;
  String picture;
  String size = "NA";
  String color = "Blue";
  int oldPrice;
  int price;
  int quantity = 1;

  Product({this.name,this.picture,this.oldPrice,this.price});

      static List ProductsList = [
      Product(name: "Levis trouser", picture:"assets/products/trouser_product.jpg", oldPrice: 120, price: 100),
       Product(name: "Lebron XII", picture:"assets/products/nike_shoe_product.jpg", oldPrice: 250, price: 200),
       Product(name: "Google redeem", picture:"assets/products/google_card_product.jpg", oldPrice: 15, price: 10),
       Product(name: "Yamaha guitar", picture:"assets/products/gutitar_product.jpg", oldPrice: 350, price: 320),
       Product(name: "Smeg Toaster", picture:"assets/products/3slice_toaster_product.jpg", oldPrice: 250, price: 220),
       Product(name: "Huawei Y9", picture:"assets/products/huawei_y9_product.jpg", oldPrice: 300, price: 290),
  ];
}