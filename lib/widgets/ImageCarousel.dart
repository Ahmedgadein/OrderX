import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatefulWidget {
  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  List images = [
    AssetImage("assets/products/product1.jpg"),
    AssetImage("assets/products/product4.jpg"),
    AssetImage("assets/products/product5.jpg"),
    AssetImage("assets/products/product3.jpg"),
    AssetImage("assets/products/product2.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Carousel(
        boxFit: BoxFit.cover,
        images:images ,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(seconds: 1),
        dotSize: 4.0,
        indicatorBgPadding: 10.0,
      ),
    );
  }
}
