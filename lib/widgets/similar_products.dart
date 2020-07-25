import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/model/product.dart';
import 'package:ecommerceapp/repository/database/ProductsService.dart';
import 'package:ecommerceapp/screens/product_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimilarProducts extends StatefulWidget {
  static List _product_list = List<Product>();

  @override
  _SimilarProductsState createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {
  ProductsService _service = ProductsService();
  List<Product> _product_list = List<Product>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _service.getRecentProducts(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          createSimilarProducts(snapshot.data);
          return GridView.builder(
              itemCount: _product_list.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (BuildContext context, int position) {
                return Padding(
                    padding: EdgeInsets.all(4.0),
                    child: SingleSimilarProduct(_product_list[position]));
              });
        } else if (!snapshot.hasData) {
          return Container(
            child: Center(
              child: Text("No Similar Products"),
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  void createSimilarProducts(List<DocumentSnapshot> snaps) {
    snaps.forEach((snap) {
      _product_list.clear();
      Product product = Product.fromSnapshot(snap);
      _product_list.add(product);
    });
  }
}

class SingleSimilarProduct extends StatelessWidget {
  Product product;

  SingleSimilarProduct(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: product.name + "similar",
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProductDetails(
                product: this.product,
              ),
            )),
            child: GridTile(
              child: Image.network(
                product.Pic1,
                fit: BoxFit.cover,
              ),
              footer: Container(
                color: Colors.white70,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          product.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0),
                        ),
                      ),
                      Text(
                        "\$" + product.price.toString(),
                        style: TextStyle(
                            color: Colors.deepPurple[500],
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
