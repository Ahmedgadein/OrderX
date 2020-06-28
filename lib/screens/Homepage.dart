import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceapp/Widgets/MenuDrawer.dart';
import 'package:ecommerceapp/Widgets/ImageCarousel.dart';
import 'package:ecommerceapp/widgets/horizontalList.dart';
import 'package:ecommerceapp/widgets/ProductsList.dart';
import 'package:ecommerceapp/screens/shopping_cart.dart';

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
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShoppingCart()));
              },
            ),
          ],
        ),
        drawer: MenuDrawer(),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 20.0, 0, 0),
              child: Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "Categories",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.grey[700]
                  ),
                ),
              ),
            ),
            SizedBox(height: 5.0,),
            HorizontalList(),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "Recent Products",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.grey[700]
                  ),
                ),
              ),
            ),
            Flexible(
              child: Products(),
            )
          ],
        ));
  }
}
