import 'package:ecommerceapp/model/product.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final Product product;

  ProductDetails({this.product});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            title: Text("Sudan OrderX"),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ],
          ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 300.0,
              child: GridTile(
                  child: Container(
                    color: Colors.white,
                      child: Image.asset(widget.product.picture))),
            )
          ],
        ),
      ),
    );
  }
}
