import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceapp/Widgets/MenuDrawer.dart';
import 'package:ecommerceapp/Widgets/ImageCarousel.dart';
import 'package:ecommerceapp/widgets/horizontalList.dart';
import 'package:ecommerceapp/widgets/ProductsList.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text("E market"),
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
        drawer: MenuDrawer(),
        body: ListView(
          children: <Widget>[
            ImageCarousel(),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "Categories",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.grey[600]
                ),
              ),
            ),
            HorizontalList(),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "Products",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.grey[600]
                ),
              ),
            ),
            Container(
              height: 320.0,
              child: Products(),
            )
          ],
        ));
  }
}
