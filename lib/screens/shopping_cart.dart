import 'package:flutter/material.dart';
import 'package:ecommerceapp/widgets/Cart_Products.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        ],
      ),

      body: CartProducts(),

      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: Text("Total:"),
                subtitle: Text("\$532"),
              ),
            ),

            Expanded(
              child: MaterialButton(
                onPressed: (){},
                child: Text("Checkout", style: TextStyle(color: Colors.white),),
                color: Colors.deepPurple,
              ),
            )
          ],
        ),
      ),
    );
  }
}
