import 'package:ecommerceapp/model/product.dart';
import 'package:ecommerceapp/repository/database/ProductsService.dart';
import 'package:ecommerceapp/widgets/featured_products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceapp/Widgets/MenuDrawer.dart';
import 'package:ecommerceapp/widgets/horizontalList.dart';
import 'package:ecommerceapp/widgets/recent_products.dart';
import 'package:ecommerceapp/screens/shopping_cart.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProductsService _service = ProductsService();
  List<Product> featured;

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Expanded(
            child: Material(
              borderRadius: BorderRadius.circular(15),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.search),
                    hintText: "Search..."
                  ),
                ),
              ),
            ),
          ),
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
//            Padding(
//              padding: EdgeInsets.fromLTRB(20.0, 20.0, 0, 0),
//              child: Container(
//                alignment: Alignment.topLeft,
//                child: Text(
//                  "Categories",
//                  style: TextStyle(
//                      fontWeight: FontWeight.bold,
//                      fontSize: 20.0,
//                      color: Colors.grey[700]
//                  ),
//                ),
//              ),
//            ),
//            SizedBox(height: 5.0,),
//            HorizontalList(),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "Featured Products",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.grey[700]
                  ),
                ),
              ),
            ),

            FeaturedProducts(),

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
              child: RecentProducts(),
            )
          ],
        ));
  }
}
