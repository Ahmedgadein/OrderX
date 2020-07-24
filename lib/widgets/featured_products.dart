import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/model/product.dart';
import 'package:ecommerceapp/repository/database/ProductsService.dart';
import 'package:ecommerceapp/screens/product_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeaturedProducts extends StatelessWidget {
  ProductsService _service = ProductsService();
  List<Product> featuredList = List<Product>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      child: FutureBuilder(
        future: _service.getFeaturedProducts(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            createFeaturedProducts(snapshot.data);
            return Container(
              child:ListView.builder(
                itemBuilder: (context, index) =>
                    SingleFeaturedProduct(featuredList[index]),
                itemCount: featuredList.length,
                scrollDirection: Axis.horizontal,
              ),
            );

          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  void createFeaturedProducts(List<DocumentSnapshot> snaps) async {
    featuredList.clear();
    snaps.forEach((snap){
      Product product = Product.fromSnapshot(snap);
      print(product.category);
      print(product.pic2.toString());
      featuredList.add(product);
    });
    print("List length: " + featuredList.length.toString());
  }
}

class SingleFeaturedProduct extends StatelessWidget {
  Product product;

  SingleFeaturedProduct(Product product) {
    this.product = product;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: Card(
          elevation: 2.0,
          child: Hero(
            tag: product.name,
            child: Material(
              child: InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductDetails(
                    product: this.product,
                  ),
                )),
                child: GridTile(
                  child: Image.network(product.pic2),
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
        ));
  }
}
