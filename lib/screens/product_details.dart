import 'package:ecommerceapp/model/product.dart';
import 'package:ecommerceapp/repository/cart_provider.dart';
import 'package:ecommerceapp/widgets/similar_products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  final Product product;
  String _selected_size;
  String _selected_color;
  String _selected_quantitiy = 1.toString();

  ProductDetails({this.product}) {
    _selected_size = product.sizes[0];
    _selected_color = product.colors[0];

    if(product.sizes.length != 0 && product.sizes.length != 0){
      product.orderSize = _selected_size;
      product.orderColor = _selected_color;
    }
  }

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      // ======== Appbar ==========
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Center(
          child: GestureDetector(
            child: Text("Sudan OrderX"),
            onTap: () {
              Navigator.of(context).pop(context);
            },
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
        ],
      ),

      //============ Body =============
      body: ListView(
        children: <Widget>[
          Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                  color: Colors.white,
                  child: Image.network(widget.product.pic2)),
              footer: new Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    widget.product.name,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  title: Row(
                    children: <Widget>[
                      !widget.product.onSale
                          ? Expanded(
                              child: Text(""),
                            )
                          : Expanded(
                              child: Text(
                                "\$" + widget.product.oldPrice.toString(),
                                style: TextStyle(
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ),
                      Expanded(
                        child: Text(
                          "\$" + widget.product.price.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red[800],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),

          // ======== Size, Color and Quantity selection ======
          Row(
            children: <Widget>[
              //Size button
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Text("Size"),
                      ),
                    ),
                    Expanded(
                        child: DropdownButton(
                            value: widget._selected_size,
                            items: widget.product.sizes
                                .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(
                                        e.toString(),
                                        style: TextStyle(
                                            color: Colors.deepPurple,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ))
                                .toList(),
                            onChanged: (String value) {
                              setState(() {
                                widget._selected_size = value;
                                widget.product.orderSize = value;
                              });
                            })),
                  ],
                ),
              ),

              //Color button
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text("Color"),
                    ),
                    Expanded(
                        child: DropdownButton(
                            value: widget._selected_color,
                            items: widget.product.colors
                                .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(
                                        e.toString(),
                                        style: TextStyle(
                                            color: Colors.deepPurple,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ))
                                .toList(),
                            onChanged: (String value) {
                              setState(() {
                                widget._selected_color = value;
                                widget.product.orderColor = value;
                              });
                            })),
                  ],
                ),
              ),

              //Quantity button
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text("Quantity"),
                    ),
                    Expanded(
                        child: DropdownButton(
                            value: widget._selected_quantitiy,
                            items: [
                              for (var i = 1;
                                  i <= int.parse(widget.product.quantity);
                                  i++)
                                DropdownMenuItem(
                                  value: i.toString(),
                                  child: Text(
                                    i.toString(),
                                    style: TextStyle(
                                        color: Colors.deepPurple,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                            ],
                            onChanged: (String value) {
                              setState(() {
                                widget._selected_quantitiy = value;
                                widget.product.orderQuantity = value;
                              });
                            })),
                  ],
                ),
              ),
            ],
          ),

//     =============== Buy Now Button =====================
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  textColor: Colors.white,
                  elevation: 0.2,
                  onPressed: () {
                    cart.addProduct(widget.product);
                  },
                  color: Colors.deepPurple,
                  child: Text("Buy now"),
                ),
              ),

              //Favourite Icon
              IconButton(
                color: Colors.deepPurple,
                icon: Icon(
                  Icons.favorite_border,
                  color: Colors.deepPurple,
                ),
              ),
            ],
          ),
          Divider(),

          // ================== Product detail ===========================
          ListTile(
              title: Text("Product details"),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(widget.product.details),
              )),
          Divider(),
          Row(
            children: <Widget>[
              //Product name
              Padding(
                padding: EdgeInsets.fromLTRB(15.0, 5.0, 5.0, 5.0),
                child: Text(
                  "Product name",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(widget.product.name.toString()),
              )
            ],
          ),

          //Product brand
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(15.0, 5.0, 5.0, 5.0),
                child: Text(
                  "Product brand",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(widget.product.brand),
              )
            ],
          ),

          //Product condition
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(15.0, 5.0, 5.0, 5.0),
                child: Text(
                  "Product condition",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(widget.product.isNew ? "New" : "Used"),
              )
            ],
          ),

          Divider(),

          Padding(
            padding: EdgeInsets.fromLTRB(15.0, 10.0, 0, 10.0),
            child: Text(
              "Similar Products",
              style: TextStyle(fontSize: 18.0, color: Colors.grey[700]),
            ),
          ),

          // ============= Similar Products ======================
          Container(height: 320.0, child: SimilarProducts())
        ],
      ),
    );
  }
}
