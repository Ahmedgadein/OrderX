import 'package:ecommerceapp/model/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  List _cart_products = Product.ProductsList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _cart_products.length,
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

  void increment(){
    widget.cart_product.quantity++;
    setState(() {
  });
}
void decrement(){
    if(widget.cart_product.quantity == 1){
      return;
    }

    widget.cart_product.quantity--;
    setState(() {
  });
}

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Container(
          width: 60.0,
          child: Image.asset(
            widget.cart_product.picture,),
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
                    child: Text(widget.cart_product.size, style: TextStyle(fontWeight: FontWeight.bold),),
                  ),

                  Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 8.0, 0, 0),
                    child: Text("Color:"),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(8.0, 8.0, 0, 0),
                    child: Text(widget.cart_product.color, style: TextStyle(fontWeight: FontWeight.bold),),
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
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              )
            ],
          ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(child: InkWell(onTap: (){increment();}, child: Icon(Icons.arrow_drop_up))),
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(widget.cart_product.quantity.toString())
                ],
              ),
            ),
            Expanded(child: InkWell(onTap: (){decrement();} ,child: Icon(Icons.arrow_drop_down))),
          ],
        ),
      ),
    );
  }
}



