import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/model/product.dart';
import 'package:ecommerceapp/repository/database/ProductsService.dart';
import 'package:ecommerceapp/screens/product_details.dart';
import 'package:flutter/material.dart';

class RecentProducts extends StatefulWidget {
  @override
  _RecentProductsState createState() => _RecentProductsState();
}

class _RecentProductsState extends State<RecentProducts> {
  ProductsService _service = ProductsService();
  List _product_list = List<Product>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _service.getRecentProducts(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          createRecentProducts(snapshot.data);
          return GridView.builder(
              itemCount: _product_list.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (BuildContext context, int position) {
                return Padding(
                    padding: EdgeInsets.all(4.0),
                    child: SingleProduct(_product_list[position]));
              });
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  void createRecentProducts(List<DocumentSnapshot> snaps) async {
    _product_list.clear();
    snaps.forEach((snap) {
      Product product = Product.fromSnapshot(snap);
      _product_list.add(product);
      print("Sizes:" + product.sizes.length.toString());
      print("Colors:" + product.colors.length.toString());
    });
  }
}

class SingleProduct extends StatelessWidget {
  Product product;

  SingleProduct(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Hero(
        tag: product.name + "recent",
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProductDetails(
                product: this.product,
              ),
            )),
            child: GridTile(
              child: Image.network(
                product.pic2,
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
