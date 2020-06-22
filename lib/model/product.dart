import 'package:flutter/material.dart';

class Product{
  String name;
  String picture;
  int oldPrice;
  int price;

  int getPrice() => price;
  int getOldPrice() => oldPrice;

  Product({this.name,this.picture,this.oldPrice,this.price});

      static List ProductsList = [
      Product(name: "Levis trouser", picture:"assets/products/trouser_product.jpg", oldPrice: 120, price: 100),
       Product(name: "Lebron XII", picture:"assets/products/nike_shoe_product.jpg", oldPrice: 250, price: 200),
       Product(name: "Google redeem", picture:"assets/products/google_card_product.jpg", oldPrice: 15, price: 10),
       Product(name: "Yamaha guitar", picture:"assets/products/gutitar_product.jpg", oldPrice: 350, price: 320),
  ];
}