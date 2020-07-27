import 'package:ecommerceapp/model/product.dart';
import 'package:ecommerceapp/repository/cart_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartProducts extends StatefulWidget {
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  @override
  Widget build(BuildContext context) {
    final _cart = Provider.of<CartProvider>(context);
    List<Product> _cart_products = _cart.cart.keys.toList();
    return ListView.builder(
        itemCount: _cart.cart.length,
        itemBuilder: (context, index) {
          return SingleCartProduct(cart_product: _cart_products[index]);
        });
  }
}

class SingleCartProduct extends StatefulWidget {
  Product cart_product;

  SingleCartProduct({this.cart_product});

  @override
  _SingleCartProductState createState() => _SingleCartProductState();
}

class _SingleCartProductState extends State<SingleCartProduct> {
  void increment() {}

  void decrement() {}

  @override
  Widget build(BuildContext context) {
    final _cart = Provider.of<CartProvider>(context);
    return Card(
      child: ListTile(
        leading: Container(
          width: 60.0,
          child: Image.network(
            widget.cart_product.pic2,
          ),
        ),
        title: Text(widget.cart_product.name),
        subtitle: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 8.0, 0, 0),
                  child: Text("Size:"),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(8.0, 8.0, 0, 0),
                  child: Text(
                    widget.cart_product.orderSize,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 8.0, 0, 0),
                  child: Text("Color:"),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(8.0, 8.0, 0, 0),
                  child: Text(
                    widget.cart_product.orderColor,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 8.0, 0, 4.0),
                child: Text(
                  "\$" + widget.cart_product.price.toString(),
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
                child: InkWell(
                    onTap: () {
                      _cart.incrementProductQuantitiy(widget.cart_product);
                      setState(() {});
                    },
                    child: Icon(Icons.arrow_drop_up))),
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(_cart.cart[widget.cart_product].toString())
                ],
              ),
            ),
            Expanded(
                child: InkWell(
                    onTap: () {
                      _cart.decrementProductQuantitiy(widget.cart_product);
                      setState(() {});
                    },
                    child: Icon(Icons.arrow_drop_down))),
          ],
        ),
      ),
    );
  }
}
